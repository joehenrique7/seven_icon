/**
 * app.js — viewer dos ícones.
 *
 * Lê viewer/icons.js (gerado pelo build) e monta o grid.
 * Nada de framework, nada de build step: é <script type="module"> puro.
 *
 * Ponto importante: o viewer NÃO sabe nada sobre a fonte. Ele só aplica as
 * classes .icon-<nome> de dist/seven_icons.css. Se um ícone aparecer em branco aqui,
 * o problema está no .ttf/no build — não neste arquivo.
 */

const grid = document.getElementById('grid');
const search = document.getElementById('search');
const countEl = document.getElementById('count');
const emptyEl = document.getElementById('empty');
const sizeInput = document.getElementById('size');
const sizeVal = document.getElementById('size-val');
const toast = document.getElementById('toast');
const dialog = document.getElementById('confirm');
const dlgGlyph = document.getElementById('confirm-glyph');
const dlgFile = document.getElementById('confirm-file');
const dlgOk = document.getElementById('confirm-ok');
const dlgCancel = document.getElementById('confirm-cancel');

let icons = [];

function load() {
  try {
    // Dados vêm de icons.js (window.__ICONS__), carregado por um <script> antes
    // deste. Assim o viewer abre com file:// puro — sem fetch, sem servidor.
    // O icons.js é escrito por emitViewer() no build, junto com o
    // seven_icons.css e o seven_icons.ttf. Nome errado/velho aqui = build não
    // rodou. Célula VAZIA com nome certo = o index.html está carregando um CSS
    // com nome diferente do que o build gera (ver build/lib/paths.js).
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

      // Clique simples copia, duplo apaga. Como o navegador dispara os dois
      // 'click' ANTES do 'dblclick', a cópia espera um instante: se o segundo
      // clique chegar nesse intervalo, o timer é cancelado e só o modal abre.
      // Sem isso, todo duplo-clique copiaria (e mostraria toast) duas vezes.
      let clickTimer;
      cell.addEventListener('click', () => {
        clearTimeout(clickTimer);
        clickTimer = setTimeout(() => copy(`icon-${icon.name}`), DOUBLE_CLICK_MS);
      });
      cell.addEventListener('dblclick', () => {
        clearTimeout(clickTimer);
        askDelete(icon);
      });

      return cell;
    })
  );
}

/** Re-renderiza respeitando o filtro de busca atual. */
function rerender() {
  const q = search.value.trim().toLowerCase();
  render(q ? icons.filter((i) => i.name.includes(q)) : icons);
}

/**
 * Fluxo de exclusão.
 *
 * O viewer não apaga nada sozinho: ele chama DELETE /api/svg/<arquivo>, que só
 * existe no build/serve.js. Abrir o index.html direto (file://) não tem
 * servidor, então a exclusão é bloqueada com uma mensagem em vez de falhar com
 * um erro de rede críptico.
 */
const DOUBLE_CLICK_MS = 220;
let pending = null; // ícone aguardando confirmação no modal

function askDelete(icon) {
  if (location.protocol === 'file:') {
    showToast('Exclusão só funciona via "npm run viewer" (precisa do servidor)');
    return;
  }
  pending = icon;
  dlgGlyph.className = `icon icon-${icon.name}`;
  dlgFile.textContent = icon.source;
  dialog.showModal();
}

async function confirmDelete() {
  const icon = pending;
  if (!icon) return;
  dialog.close();
  pending = null;

  try {
    const res = await fetch(`/api/svg/${encodeURIComponent(icon.source)}`, { method: 'DELETE' });
    const body = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(body.error || `HTTP ${res.status}`);

    // Some da lista em memória na hora. O icons.js em disco continua com ele
    // até o próximo build — por isso o aviso no toast.
    icons = icons.filter((i) => i !== icon);
    countEl.textContent = `(${icons.length})`;
    rerender();
    showToast(`Movido para _deleted/: ${icon.source} — rode "npm run build"`);
  } catch (e) {
    showToast(`Não consegui apagar: ${e.message}`);
  }
}

dlgOk.addEventListener('click', confirmDelete);
dlgCancel.addEventListener('click', () => dialog.close());
dialog.addEventListener('close', () => {
  pending = null;
});

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

search.addEventListener('input', rerender);

sizeInput.addEventListener('input', () => {
  const px = sizeInput.value;
  document.documentElement.style.setProperty('--icon-size', `${px}px`);
  sizeVal.textContent = `${px}px`;
});

load();
