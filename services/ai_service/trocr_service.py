import cv2
import numpy as np

from PIL import Image
import torch
from transformers import TrOCRProcessor, VisionEncoderDecoderModel

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"

# Load once (module-level). This is the key for performance.
processor = TrOCRProcessor.from_pretrained("microsoft/trocr-base-handwritten")
model = VisionEncoderDecoderModel.from_pretrained("microsoft/trocr-base-handwritten").to(DEVICE)

def preprocess_for_ocr(image: Image.Image) -> Image.Image:
    import cv2
    import numpy as np

    img = np.array(image)

    # safety: ensure uint8
    if img.dtype != np.uint8:
        img = img.astype(np.uint8)

    gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

    # resize down if image is too large (VERY IMPORTANT)
    h, w = gray.shape
    max_dim = 1024
    if max(h, w) > max_dim:
        scale = max_dim / max(h, w)
        gray = cv2.resize(gray, None, fx=scale, fy=scale)

    # mild denoise
    gray = cv2.GaussianBlur(gray, (5, 5), 0)

    # simple threshold first (safer than adaptive)
    _, thr = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)

    return Image.fromarray(thr).convert("RGB")

def read_handwritten_text(image: Image.Image) -> str:
    clean = preprocess_for_ocr(image)

    pixel_values = processor(images=clean, return_tensors="pt").pixel_values.to(DEVICE)
    generated_ids = model.generate(pixel_values, max_new_tokens=128)
    text = processor.batch_decode(generated_ids, skip_special_tokens=True)[0]
    return text.strip()