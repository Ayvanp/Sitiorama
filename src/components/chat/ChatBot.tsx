import React from "react";
import ChatSidebar from "./ChatSidebar";
import ChatMessages from "./ChatMessages";
import ChatFooter from "./ChatFooter";

// Interfaz para los mensajes
export interface Message {
  id: string;
  role: "user" | "assistant" | "system";
  content: string;
}

export default function ChatBot() {
  // Manejo del input del usuario
  const [userInput, setUserInput] = React.useState("");
  // Historial de mensajes
  const [messages, setMessages] = React.useState<Message[]>([]);
  // Función para enviar un mensaje
  async function handleSend() {
    if (!userInput.trim()) return;

    // Crear objeto del usuario
    const newMessage: Message = {
      id: crypto.randomUUID(), // Genera un UUID (Node >=19 ó Browsers con soporte)
      role: "user",
      content: userInput.trim(),
    };

    // Agregar a la lista de mensajes
    setMessages((prev) => [...prev, newMessage]);
    // Limpiar el input
    setUserInput("");

    // Aquí puedes llamar a tu backend Python/Chroma/OpenAI
    // Por ahora, simulamos una respuesta con setTimeout
    setTimeout(() => {
      const simulatedResponse: Message = {
        id: crypto.randomUUID(),
        role: "assistant",
        content: "Esta es una respuesta simulada desde el servidor!",
      };
      setMessages((prev) => [...prev, simulatedResponse]);
    }, 800);
  }

  return (
    <div className="min-h-screen bg-gray-900 flex items-start justify-center p-4">
      <div className="flex w-full max-w-5xl h-[700px] bg-gray-800 rounded-lg border border-gray-700 shadow-lg overflow-hidden">
        
        {/* Barra lateral */}
        <ChatSidebar />
        
        {/* Área principal */}
        <main className="flex-1 flex flex-col">
          {/* Encabezado */}
          <div className="p-4 flex justify-between items-center border-b border-gray-700">
            <div>
              <h2 className="text-lg font-medium text-white">Conversación</h2>
              <p className="text-sm text-gray-400">{messages.length} mensajes</p>
            </div>
            <div className="flex gap-2">
              <button className="rounded-full h-9 w-9 flex items-center justify-center">
                ✏️
              </button>
              <button className="rounded-full h-9 w-9 flex items-center justify-center">
                📤
              </button>
              <button className="rounded-full h-9 w-9 flex items-center justify-center">
                ⚙️
              </button>
              <button className="rounded-full h-9 w-9 flex items-center justify-center">
                ⛶
              </button>
            </div>
          </div>

          {/* Mensajes */}
          <ChatMessages messages={messages} />

          {/* Footer (input + botón de envío) */}
          <ChatFooter
            userInput={userInput}
            setUserInput={setUserInput}
            onSend={handleSend}
          />
        </main>
      </div>
    </div>
  );
}
