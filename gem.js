import "dotenv/config"
import { GoogleGenerativeAI } from "@google/generative-ai"

const genAI = new GoogleGenerativeAI(process.env.GOOG_AI_KEY);
const gemini = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });


let samplePrompt = "Tell me a joke regarding cars.";

async function testPrompt() {
    const result = await gemini.generateContent(samplePrompt);
    const response = await result.response;
    const text = response.text();
    console.log("Total tokens: ", response.usageMetadata.totalTokenCount);
    console.log(text);
}

testPrompt();