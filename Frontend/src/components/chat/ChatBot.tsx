import React from "react";
import ChatSidebar from "./ChatSidebar";
import ChatMessages from "./ChatMessages";
import ChatFooter from "./ChatFooter";

export interface Message {
  id: string;
  role: "user" | "assistant" | "system";
  content: string;
}

export default function ChatBot() {
  const [userInput, setUserInput] = React.useState("");
  const [messages, setMessages] = React.useState<Message[]>([]);
  const [loading, setLoading] = React.useState(false);

  async function handleSend() {
    const question = userInput.trim();
    if (!question || loading) return;

    // Añade el mensaje del usuario
    const userMsg: Message = {
      id: crypto.randomUUID(),
      role: "user",
      content: question,
    };
    setMessages((prev) => [...prev, userMsg]);
    setUserInput("");
    setLoading(true);

    try {
      // Llamada al backend FastAPI
      const res = await fetch("/api/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question }),
      });

      if (!res.ok) throw new Error(await res.text());
      const data: { answer: string } = await res.json();

      // Agrega la respuesta del asistente
      const botMsg: Message = {
        id: crypto.randomUUID(),
        role: "assistant",
        content: data.answer,
      };
      setMessages((prev) => [...prev, botMsg]);
    } catch (err) {
      console.error(err);
      setMessages((prev) => [
        ...prev,
        {
          id: crypto.randomUUID(),
          role: "system",
          content: "⚠️ Error al conectar con el servidor. Intenta más tarde.",
        },
      ]);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="min-h-screen bg-gray-900 flex items-start justify-center p-4">
      <div className="flex w-full max-w-5xl h-[700px] bg-gray-800 rounded-lg border border-gray-700 shadow-lg overflow-hidden">
        <ChatSidebar />

        <main className="flex-1 flex flex-col">
          {/* Header */}
          <div className="p-4 flex justify-between items-center border-b border-gray-700">
            <div>
              <h2 className="text-lg font-medium text-white">Conversación</h2>
              <p className="text-sm text-gray-400">{messages.length} mensajes</p>
            </div>
            {loading && (
              <span className="text-sm text-blue-400 animate-pulse">Pensando…</span>
            )}
          </div>

          {/* Mensajes */}
          <ChatMessages messages={messages} />

          {/* Footer */}
          <ChatFooter
            userInput={userInput}
            setUserInput={setUserInput}
            onSend={handleSend}
            loading={loading}
          />
        </main>
      </div>
    </div>
  );
}
