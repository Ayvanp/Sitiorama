import React from "react";
import SendIcon from "../icons/send.tsx"; // Ajusta la ruta según dónde tengas el icono

interface ChatFooterProps {
  userInput: string;
  setUserInput: React.Dispatch<React.SetStateAction<string>>;
  onSend: () => void;
}

/**
 * Pie de la ventana del chat (textarea + botón enviar)
 */
export default function ChatFooter({
  userInput,
  setUserInput,
  onSend,
}: ChatFooterProps) {
  // Manejar Enter/Shift+Enter
  function handleKeyDown(e: React.KeyboardEvent<HTMLTextAreaElement>) {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      onSend();
    }
  }

  return (
    <footer className="p-4 border-t border-gray-700 relative">
      <textarea
        placeholder="Enter para enviar, Shift + Enter para salto de línea, etc."
        className="min-h-[60px] w-full bg-gray-800 border border-gray-700 text-gray-200 placeholder:text-gray-500 resize-none pr-12 pl-3 py-2 rounded"
        onChange={(e) => setUserInput(e.target.value)}
        onKeyDown={handleKeyDown}
        value={userInput}
      />
      <button
        onClick={onSend}
        className="absolute right-6 bottom-8 bg-blue-600 hover:bg-blue-700 rounded-full h-10 w-10 p-0 flex items-center justify-center"
      >
        <SendIcon className="w-5 h-5 text-white" />
      </button>
    </footer>
  );
}
