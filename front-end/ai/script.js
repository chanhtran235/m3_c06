// Thay thế YOUR_API_KEY bằng API key của bạn
const API_KEY = "AIzaSyC0X5VQBO8Me0HIrLElh5pWfEPPRWq46U0";
const API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent";
const chatBox = document.getElementById("chat-box");
const userInput = document.getElementById("user-input");
const sendBtn = document.getElementById("send-btn");

// Hàm để thêm tin nhắn vào giao diện
function addMessage(text, sender) {
    const messageDiv = document.createElement("div");
    messageDiv.classList.add("message", sender);
    messageDiv.innerText = text;
    chatBox.appendChild(messageDiv);
    chatBox.scrollTop = chatBox.scrollHeight;
}

// Hàm để gọi API Gemini
async function getGeminiResponse(prompt) {
    const data = {
        "contents": [
            {
                "parts": [
                    {
                        "text": prompt
                    }
                ]
            }
        ]
    };

    try {
        const response = await fetch(API_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-goog-api-key": API_KEY // Đây là cách đúng để truyền API Key
            },
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            // Hiển thị lỗi chi tiết hơn nếu có
            const errorData = await response.json();
            throw new Error(`HTTP error! Status: ${response.status} - ${errorData.error.message}`);
        }

        const result = await response.json();
        // Lấy nội dung phản hồi từ Gemini
        return result.candidates[0].content.parts[0].text;
    } catch (error) {
        console.error("Error calling Gemini API:", error);
        return "Xin lỗi, đã có lỗi xảy ra. Vui lòng thử lại sau.";
    }
}

// Xử lý sự kiện khi người dùng gửi tin nhắn
sendBtn.addEventListener("click", async () => {
    const userMessage = userInput.value.trim();
    if (userMessage === "") return;

    // Thêm tin nhắn của người dùng vào giao diện
    addMessage(userMessage, "user");
    userInput.value = "";

    // Lấy phản hồi từ Gemini và thêm vào giao diện
    const geminiResponse = await getGeminiResponse(userMessage);
    addMessage(geminiResponse, "gemini");
});

// Xử lý sự kiện khi nhấn Enter
userInput.addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
        sendBtn.click();
    }
});