import { GoogleGenAI } from "@google/genai";
import dotenv from "dotenv";

dotenv.config();

const key = process.env.GEMINI_API_KEY;
console.log("Key loaded:", !!key, "| prefix:", key?.substring(0, 10));
console.log("Key length:", key?.length);

const ai = new GoogleGenAI({ apiKey: key });

// Test gemini-2.0-flash
console.log("\n--- Testing gemini-2.0-flash ---");
try {
  const r = await ai.models.generateContent({ model: "gemini-2.0-flash", contents: "Say hi in 3 words." });
  console.log("gemini-2.0-flash OK:", r.text);
} catch (e) {
  console.log("gemini-2.0-flash FAIL:", e.message?.substring(0, 300));
}

// Test gemini-2.5-flash
console.log("\n--- Testing gemini-2.5-flash ---");
try {
  const r = await ai.models.generateContent({ model: "gemini-2.5-flash", contents: "Say hi in 3 words." });
  console.log("gemini-2.5-flash OK:", r.text);
} catch (e) {
  console.log("gemini-2.5-flash FAIL:", e.message?.substring(0, 300));
}

// Test gemini-1.5-flash-latest
console.log("\n--- Testing gemini-1.5-flash-latest ---");
try {
  const r = await ai.models.generateContent({ model: "gemini-1.5-flash-latest", contents: "Say hi in 3 words." });
  console.log("gemini-1.5-flash-latest OK:", r.text);
} catch (e) {
  console.log("gemini-1.5-flash-latest FAIL:", e.message?.substring(0, 300));
}

// List available models
console.log("\n--- Available Gemini models ---");
try {
  const models = await ai.models.list();
  for await (const m of models) {
    if (m.name?.toLowerCase().includes("gemini")) {
      console.log(" ", m.name, "|", m.supportedActions?.join(",") || "");
    }
  }
} catch (e) {
  console.log("List models FAIL:", e.message?.substring(0, 300));
}
