/**
 * app.js — viewer dos ícones.
 *
 * Lê dist/icons.json (gerado pelo build) e monta o grid.
 * Nada de framework, nada de build step: é <script type="module"> puro.
 *
 * Ponto importante: o viewer NÃO sabe nada sobre a fonte. Ele só aplica as
 * classes .icon-<nome> de dist/icons.css. Se um ícone aparecer em branco aqui,
 * o problema está no .ttf/no build — não neste arquivo.
 */

const grid = document.getElementById('grid');
const search = document.getElementById('search');
const countEl = document.getElementById('count');
const emptyEl = document.getElementById('empty');
const sizeInput = document.getElementById('size');
const sizeVal = document.getElementById('size-val');
const toast = document.getElementById('toast');

let icons = [];

function load() {
  try {
    // Dados vêm de icons.js (window.__ICONS__), carregado por um <script> antes
    // deste. Assim o viewer abre com file:// puro — sem fetch, sem servidor.
    // O icons.js é gerado do icons.json (veja "npm run build" / scripts do build).
    const data = window.__ICONS__;
    if (!data || !Array.isArray(data.icons)) {
      throw new Error('window.__ICONS__ ausente ou inválido');
    }
    icons = data.icons;
    countEl.textContent = `(${icons.length})`;
    render(icons);
  } catch (e) {
    grid.innerHTML = '';
    emptyEl.hidden = false;
    emptyEl.textContent = `Não consegui ler icons.js (${e.message}). Rode "npm run build".`;
  }
}

function render(list) {
  emptyEl.hidden = list.length > 0;
  grid.replaceChildren(
    ...list.map((icon) => {
      const cell = document.createElement('button');
      cell.className = 'cell';
      cell.title = `Copiar "icon-${icon.name}"`;

      const glyph = document.createElement('span');
      // As duas classes: .icon (a família) + .icon-<nome> (o codepoint).
      glyph.className = `icon icon-${icon.name}`;
      glyph.setAttribute('aria-hidden', 'true');

      const name = document.createElement('span');
      name.className = 'name';
      name.textContent = icon.name;

      const hex = document.createElement('span');
      hex.className = 'hex';
      hex.textContent = `U+${icon.hex.toUpperCase()}`;

      cell.append(glyph, name, hex);
      cell.addEventListener('click', () => copy(`icon-${icon.name}`));
      return cell;
    })
  );
}

async function copy(text) {
  try {
    await navigator.clipboard.writeText(text);
    showToast(`Copiado: ${text}`);
  } catch {
    showToast('Não consegui copiar (o navegador bloqueou)');
  }
}

let toastTimer;
function showToast(msg) {
  toast.textContent = msg;
  toast.classList.add('show');
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => toast.classList.remove('show'), 1600);
}

search.addEventListener('input', () => {
  const q = search.value.trim().toLowerCase();
  render(q ? icons.filter((i) => i.name.includes(q)) : icons);
});

sizeInput.addEventListener('input', () => {
  const px = sizeInput.value;
  document.documentElement.style.setProperty('--icon-size', `${px}px`);
  sizeVal.textContent = `${px}px`;
});

load();
