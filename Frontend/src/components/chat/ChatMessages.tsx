import React from "react";
import type { Message } from "./types";
import MessageBubble from "./MessageBubble";

/**
 * Sección que muestra la lista de mensajes
 */
export default function ChatMessages({ messages }: { messages: Message[] }) {
  return (
    <section className="flex-1 overflow-auto p-4">
      {messages.map((msg) => (
        <MessageBubble key={msg.id} message={msg} />
      ))}
    </section>
  );
}
