import io
import traceback
from PIL import Image
from ai_service.trocr_service import read_handwritten_text

from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI(title="ALAGA Backend API")

# allow phone app to call your PC backend during development
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health")
def health():
    return {"ok": True}

@app.post("/mada/ocr")
async def mada_ocr(file: UploadFile = File(...)):
    try:
        contents = await file.read()
        image = Image.open(io.BytesIO(contents)).convert("RGB")

        ocr_text = read_handwritten_text(image)

        return {
            "filename": file.filename,
            "ocr_text": ocr_text,
        }

    except Exception as e:
        traceback.print_exc()  # prints full error to backend terminal
        raise HTTPException(status_code=500, detail=str(e))
