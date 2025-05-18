import React, { useEffect, useState } from 'react';

const categories = [
  { id: 1, name: 'Gastronomía' },
  { id: 2, name: 'Cultura' },
  { id: 3, name: 'Naturaleza' },
  { id: 4, name: 'Diversión' },
];

export default function LugarList() {
  const [categoryId, setCategoryId] = useState(1);
  const [places, setPlaces] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:8000/places?category_id=${categoryId}`, {
      credentials: 'include'
    })
    .then(res => res.json())
    .then(data => setPlaces(data));
  }, [categoryId]);

  return (
    <div>
      <div className="mb-6 flex gap-4">
        {categories.map(cat => (
          <button
            key={cat.id}
            onClick={() => setCategoryId(cat.id)}
            className={`px-4 py-2 rounded ${
              categoryId === cat.id ? 'bg-blue-600 text-white' : 'bg-gray-200'
            }`}
          >
            {cat.name}
          </button>
        ))}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {places.map(place => (
          <div key={place.id} className="p-4 border rounded shadow">
            <h2 className="text-xl font-semibold">{place.name}</h2>
            <p className="text-gray-700">{place.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
