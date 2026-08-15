NEON TURNTABLE — offline setup
================================

This viewer loads three.js and a couple of small assets from a local
"vendor" folder instead of the internet — but that folder starts out
empty, since the actual library files are a few MB and can't be baked
into this zip in advance.

ONE-TIME SETUP (needs internet, only once):

  macOS / Linux:
    1. Unzip this folder somewhere.
    2. Open a terminal in that folder.
    3. Run:  bash fetch-vendor.sh
    4. Done — open index.html in your browser.

  Windows:
    - Easiest: install Git for Windows (comes with Git Bash), then run
      the same steps above in Git Bash.
    - Or, if you have WSL: run it there.
    - Or open fetch-vendor.sh in a text editor, and manually download
      each URL listed in it into the matching "vendor/..." path shown
      in each line.

After that one-time run, everything — loading, viewing, and editing
your own .glb files — works completely offline. No server needed,
just double-click index.html.

Note: the "Custom HDR…" button (for your own .hdr environment files)
and loading your own .glb/.gltf models were always 100% local already —
nothing about your models is ever uploaded anywhere.
