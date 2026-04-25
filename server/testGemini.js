import { GoogleGenAI } from "@google/genai";
import dotenv from 'dotenv';
dotenv.config();

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

async function run() {
  try {
    const response = await ai.models.generateContent({
        model: "gemini-1.5-flash-8b",
        contents: "Say hi"
    });
    console.log("8b works:", response.text);
  } catch (e) {
    console.log("8b failed:", e.message);
  }

  try {
    const response = await ai.models.generateContent({
        model: "gemini-1.5-pro",
        contents: "Say hi"
    });
    console.log("pro works:", response.text);
  } catch (e) {
    console.log("pro failed:", e.message);
  }
}
run();
