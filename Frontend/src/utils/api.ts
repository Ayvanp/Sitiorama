export async function fetchPlaces() {
  const res = await fetch('http://localhost:8000/places?category_id=1&limit=30');
  if (!res.ok) throw new Error('Error al obtener lugares');
  return res.json();
}