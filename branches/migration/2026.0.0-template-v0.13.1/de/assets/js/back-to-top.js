/* Back-to-top button — appears after one viewport of scrolling, jumps to the
 * page top. Written instead of wiring the base's dormant topofpage.js: that
 * script fades in at 50px (nearly immediately), fires a tooltip on load and
 * hard-animates 800ms with no prefers-reduced-motion respect. This one shows
 * after ~1 viewport, scrolls smoothly ONLY when the reader has not asked for
 * reduced motion, and moves focus to the page-top anchor so keyboard users
 * land where they jumped.
 *
 * REMOVAL (one commit): delete this file, the "back-to-top" block in
 * content/assets/css/template-base.css, and the .ig-back-to-top block in
 * includes/fragment-header.html. Styleguide §8 carries the same note.
 */
(function () {
  "use strict";
  var btn = document.querySelector(".ig-back-to-top");
  if (!btn) return;
  var reduced = window.matchMedia("(prefers-reduced-motion: reduce)");
  var ticking = false;

  function update() {
    ticking = false;
    if (window.scrollY > window.innerHeight) {
      btn.classList.add("visible");
    } else {
      btn.classList.remove("visible");
    }
  }
  window.addEventListener("scroll", function () {
    if (!ticking) { ticking = true; requestAnimationFrame(update); }
  }, { passive: true });
  update();

  btn.addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: reduced.matches ? "auto" : "smooth" });
    var top = document.querySelector('a[name="top"]');
    if (top) {
      top.setAttribute("tabindex", "-1");
      top.focus({ preventScroll: true });
    }
  });
})();
