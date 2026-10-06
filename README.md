# mpvgeet - mpv portable siap pakai

Paket config portable untuk mpv di Windows. Jalankan tanpa install, semua setting ikut terbawa di folder `portable_config`.

## Apa ini

Repo ini berisi folder `portable_config` siap pakai: file `mpv.conf`, script Lua di `scripts/`, file conf di `script-opts/`, dan font ikon di `fonts/`.

Disclaimer: binary mpv diambil dari build dev resmi di bawah ini, bukan dibuat from scratch. Repo ini hanya berisi `portable_config` dan panduan. Binary tidak disertakan, unduh terpisah:

https://github.com/mpv-player/mpv/releases/tag/git-release

Build yang dipakai adalah build dev otomatis `git-release` dari branch master via github-actions (contoh v0.41.0-dev), BUKAN rilis stabil resmi. Berisi binary dev Windows, macOS, libmpv, plus sumber tarball/zipball. Lisensi dan file binary mengikuti paket unduhan tersebut.

## Cara rakit (3 langkah)

1. Unduh mpv build Windows dari https://github.com/mpv-player/mpv/releases/tag/git-release, lalu ekstrak ke folder bebas, contoh `D:\Portable Apps\mpvgeet`.
2. Copy folder `portable_config` dari repo ini ke sebelah `mpv.exe` hasil ekstrak langkah 1.
3. Jalankan `mpv.exe` untuk memastikan config terbaca. Struktur akhir harus: `mpv.exe` dan folder `portable_config` berada di folder yang sama.

## Cara pakai

1. Jalankan `mpv.exe` dengan double klik, tidak perlu install.
2. Drag file video ke jendela mpv, atau klik kanan video lalu pilih Open with lalu `mpv.exe`.
3. Semua setting tersimpan di `portable_config` di sebelah `mpv.exe`, aman dipindah ke flashdisk atau folder lain.
4. Butuh reset? Hapus file di `portable_config\watch_later` atau kembalikan `mpv.conf` ke isi semula.

## Cara jadi default player

1. Klik kanan `mpv-register.bat` lalu pilih Run as administrator. File ini berasal dari paket binary mpv, bukan dari repo config ini.
2. Buka Settings Windows lalu masuk ke Apps lalu Default apps.
3. Pilih mpv untuk ekstensi video seperti mp4, mkv, dan avi.
4. Untuk melepas: klik kanan `mpv-unregister.bat` lalu pilih Run as administrator.

Catatan SmartScreen / Defender:

- File bat dan `mpv.exe` berasal dari build dev mpv, kadang dianggap mencurigakan oleh SmartScreen atau Defender.
- Ini umum sebagai false-positive untuk build dev yang tidak ditandatangani.
- Jika ragu, klik kanan file lalu Properties untuk cek publisher, dan jalankan hanya di PC sendiri.

## Plugin pre-installed

Isi `portable_config\scripts`:

- `modernz.lua` : UI ModernZ sebagai pengganti OSC bawaan, cocok dengan `osc=no` di `mpv.conf`.
- `thumbfast.lua` : preview thumbnail saat seek di timeline (umumnya dari po5/thumbfast, bukan Eisa01, perlu konfirmasi tombol atau trigger di setup ini).
- `UndoRedo.lua` : undo dan redo aksi navigasi atau playlist (perlu konfirmasi binding tombol).
- `status-line.lua` : baris status tambahan untuk info pemutaran (ada di root repo cniw/mpv-discordRPC, bukan Eisa01, perlu konfirmasi tampilan yang aktif).
- `SmartSkip.lua` : lompat segmen cerdas seperti intro atau bagian tertentu (perlu konfirmasi pola skip yang aktif).
- `SmartCopyPaste_II.lua` : copy dan paste path, URL, atau judul video (perlu konfirmasi binding).
- `SimpleHistory.lua` : mencatat riwayat file yang pernah diputar.
- `SimpleBookmark.lua` : menyimpan bookmark posisi video.
- `mpv-discordRPC\main.lua` : menampilkan status tontonan ke Discord Rich Presence, file pendukung `catalogs.lua`, `lua-discordRPC.lua`, dan `python-pypresence.py`.
- `thumbfast.lua` di atas BUKAN dari Eisa01, umumnya dari https://github.com/po5/thumbfast (perlu konfirmasi kecocokan versi).

File conf pendamping di `portable_config\script-opts`:

- `modernz.conf` : setting tampilan ModernZ.
- `mpv-discordRPC.conf` : setting Discord Rich Presence.
- `mpv_discordRPC.conf` : nama mirip dengan strip dan underscore, cek mana yang aktif (perlu konfirmasi).
- `SimpleBookmark.conf` : setting bookmark posisi.
- `SimpleHistory.conf` : setting riwayat putar.
- `SmartCopyPaste_II.conf` : setting copy paste (perlu konfirmasi binding).
- `SmartSkip.conf` : setting pola skip (perlu konfirmasi pola yang aktif).

Font tambahan:

- `portable_config\fonts\modernz-icons.ttf` : font ikon untuk UI ModernZ.

Konfig aktif di `portable_config\mpv.conf` (6 opsi inti):

- `osc=no` : matikan OSC bawaan karena memakai ModernZ.
- `osd-bar=no` : matikan OSD bar bawaan.
- `title-bar=no` : sembunyikan title bar bawaan, catatan opsi ini hanya efek di sebagian build atau OS.
- `keep-open=yes` : jendela tetap terbuka setelah video selesai.
- `save-position-on-quit=yes` : simpan posisi terakhir saat quit, tersimpan di `watch_later`.
- Baris komentar header `# mpv portable config - Minimal + ModernZ`.
- Plus 2 baris branding mpvgeet: `title=mpvgeet - ${filename}` agar judul jendela memakai nama file, dan komentar `# branding: mpvgeet siap pakai`.

## Sumber plugin

Verifikasi tiap plugin ke sumber aslinya di bawah ini, ditulis sebagai link mentah:

https://github.com/Eisa01/mpv-scripts

Koleksi script Eisa01 (lisensi BSD-2-Clause), mencakup SmartSkip, SmartCopyPaste_II, SimpleHistory, SimpleBookmark, dan UndoRedo sesuai penamaan di paket ini. Catatan: thumbfast.lua dan status-line.lua TIDAK dari repo ini.

https://github.com/Samillion/ModernZ

Sumber UI ModernZ (lisensi LGPL-2.1) yaitu `modernz.lua`, `modernz.conf`, dan font `modernz-icons.ttf`.

https://github.com/cniw/mpv-discordRPC

Sumber Discord Rich Presence (lisensi MIT) yaitu `mpv-discordRPC/main.lua` plus file pendukung `catalogs.lua`, `lua-discordRPC.lua`, `python-pypresence.py`, dan file conf terkait. Catatan: `status-line.lua` di paket ini ada di root repo ini, bukan dari Eisa01.

## Lisensi

- mpv adalah software GPL. File `LICENSE.GPL` ada di paket binary yang diunduh dari halaman release di atas, bukan di repo ini.
- Config di repo ini mengikuti lisensi asal tiap plugin: Eisa01 BSD-2-Clause, ModernZ LGPL-2.1, mpv-discordRPC MIT. Cek tiap link sumber plugin di atas sebelum redistribusi.
- Font `modernz-icons.ttf` mengikuti lisensi proyek ModernZ.
