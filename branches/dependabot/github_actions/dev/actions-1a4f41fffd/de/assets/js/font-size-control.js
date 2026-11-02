/* Font-size control (A / A+ / A++) — three reader-selectable levels.
 *
 * Level 0 (A) is the DEFAULT: no attribute, no CSS rule — the page renders
 * byte-identical to a build without this feature, so a reader can always
 * revert to the exact original. Levels 1/2 set data-fontsize on <html>;
 * template-base.css maps them to `zoom` on #segment-content (zoom scales the
 * COMPUTED rendering, so the publisher-generated artifact tables with their
 * inline px font sizes grow too, and layout reflows like browser zoom).
 * The choice persists per reader in localStorage; no cookie, no server.
 *
 * REMOVAL (one commit): delete this file, the "font-size control" block in
 * content/assets/css/template-base.css, and the ig-fontsize block in
 * includes/fragment-header.html. Styleguide §5a carries the same note.
 */
(function () {
  "use strict";
  var KEY = "ig-fontsize";
  var root = document.documentElement;

  function level() {
    try { return localStorage.getItem(KEY) || "0"; } catch (e) { return "0"; }
  }
  function apply(lv) {
    if (lv === "1" || lv === "2") {
      root.setAttribute("data-fontsize", lv);
    } else {
      lv = "0";
      root.removeAttribute("data-fontsize");
    }
    var btns = document.querySelectorAll(".ig-fontsize button");
    for (var i = 0; i < btns.length; i++) {
      btns[i].setAttribute("aria-pressed",
        btns[i].getAttribute("data-level") === lv ? "true" : "false");
    }
  }
  function store(lv) {
    try { localStorage.setItem(KEY, lv); } catch (e) { /* private mode: session-only */ }
  }

  apply(level());

  document.addEventListener("click", function (ev) {
    var btn = ev.target && ev.target.closest && ev.target.closest(".ig-fontsize button");
    if (!btn) return;
    var lv = btn.getAttribute("data-level") || "0";
    store(lv);
    apply(lv);
  });
})();
