# mpvgeet: Cheatsheet Shortcut Keyboard

Tombol untuk build mpvgeet, yaitu mpv portable dengan config di folder `portable_config`. Bagian 1 sampai 3 adalah shortcut bawaan mpv. Bagian 4 sampai 11 ditambahkan oleh config repo ini. Binding dari script memakai forced binding, jadi menggantikan tombol bawaan yang sama. Lihat bagian 12.

## 1. Pemutaran dan navigasi (bawaan mpv)

| Tombol | Aksi |
| --- | --- |
| `q` | Keluar |
| `Q` | Keluar dan simpan posisi terakhir |
| `ESC` | Keluar fullscreen |
| `p`, `SPACE` | Play atau jeda |
| `.` | Maju satu frame lalu jeda |
| `,` | Mundur satu frame lalu jeda |
| `←` | Mundur 5 detik |
| `→` | Maju 5 detik |
| `↑` | Maju 60 detik |
| `↓` | Mundur 60 detik |
| `Shift+←`, `Shift+→` | Mundur atau maju 1 detik secara tepat |
| `Shift+↑`, `Shift+↓` | Mundur atau maju 5 detik secara tepat |
| `Ctrl+←`, `Ctrl+→` | Subtitle sebelumnya atau berikutnya |
| `Ctrl+Shift+←`, `Ctrl+Shift+→` | Geser timing subtitle mundur atau maju |
| `HOME` | Kembali ke awal video |
| `PGUP`, `PGDWN` | Chapter berikutnya atau sebelumnya |
| `Shift+PGUP`, `Shift+PGDWN` | Maju atau mundur 10 menit |
| `[`, `]` | Turunkan atau naikkan kecepatan 10 persen |
| `{`, `}` | Kecepatan setengah atau dua kali |
| `BS` | Reset kecepatan ke 1x |
| `Shift+BS` | Kembali ke posisi sebelum seek terakhir |
| `<`, `>` | File playlist sebelumnya atau berikutnya |
| `ENTER` | File playlist berikutnya |
| `Shift+HOME`, `Shift+END` | File pertama atau terakhir di playlist |
| `o` | Tampilkan progres pemutaran |
| `O` | Toggle level OSD, tampil saat interaksi atau terus-menerus |
| `i`, `I` | Info dan statistik, tampilkan atau toggle |
| `?` | Tampilkan daftar tombol |
| `` ` `` | Buka konsol perintah |
| `F8` | Tampilkan playlist |
| `F9` | Tampilkan daftar track |
| `l` | Set atau hapus titik A-B loop |
| `L` | Toggle loop file |
| `T` | Toggle video selalu di atas jendela lain |
| `f` | Toggle fullscreen |
| `Alt+0`, `Alt+1`, `Alt+2` | Ukuran jendela 0,5x, 1x, 2x |
| `w`, `W`, `e` | Kurangi atau perluas area gambar (panscan) |
| `A` | Ganti rasio aspect |

Tombol numpad dipakai untuk zoom, pan, dan rotasi. `KP5` mereset skala, `Ctrl+KP5` mereset posisi, `Alt+KP5` mereset rotasi.

## 2. Audio, subtitle, dan video (bawaan mpv)

| Tombol | Aksi |
| --- | --- |
| `m` | Toggle mute |
| `9`, `/` | Volume turun 2 |
| `0`, `*` | Volume naik 2 |
| `z` | Subtitle 100 ms lebih awal |
| `Z`, `x` | Subtitle 100 ms lebih lambat |
| `Ctrl++`, `Ctrl+-` | Audio delay tambah atau kurang 0,1 detik |
| `G`, `F` | Perbesar atau perkecil font subtitle |
| `r` | Geser subtitle ke atas |
| `R`, `t` | Geser subtitle ke bawah |
| `v` | Toggle subtitle |
| `Alt+v` | Toggle subtitle sekunder |
| `V` | Ganti sumber data video untuk subtitle ASS |
| `u` | Toggle override gaya SSA/ASS |
| `j`, `J` | Track subtitle berikutnya atau sebelumnya |
| `SHARP` (`#`) | Track audio berikutnya |
| `_` | Track video berikutnya |
| `b` | Toggle filter deband |
| `d` | Cycle deinterlace |
| `E` | Ganti edition |
| `Ctrl+h` | Toggle hardware decoding |

## 3. Screenshot (bawaan mpv)

| Tombol | Aksi |
| --- | --- |
| `s` | Screenshot video dengan subtitle |
| `S` | Screenshot video tanpa subtitle |
| `Ctrl+s` | Screenshot jendela termasuk OSD dan subtitle |
| `Alt+s` | Screenshot tiap frame, tekan lagi untuk berhenti |

## 4. Shader Anime4K (`input.conf`)

| Tombol | Aksi |
| --- | --- |
| `CTRL+1` | Anime4K Mode A (HQ) |
| `CTRL+2` | Mode B (HQ) |
| `CTRL+3` | Mode C (HQ) |
| `CTRL+4` | Mode A+A (HQ) |
| `CTRL+5` | Mode B+B (HQ) |
| `CTRL+6` | Mode C+A (HQ) |
| `CTRL+0` | Hapus semua shader GLSL |

## 5. Undo dan Redo (`UndoRedo.lua`)

| Tombol | Aksi |
| --- | --- |
| `ctrl+z`, `ctrl+Z` | Undo aksi navigasi atau playlist |
| `ctrl+y`, `ctrl+Y` | Redo aksi navigasi atau playlist |
| `ctrl+alt+z`, `ctrl+alt+Z` | Undo loop |

## 6. SmartSkip

| Tombol | Aksi |
| --- | --- |
| `ctrl+.` | Aktifkan atau nonaktifkan auto-skip |
| `alt+.` | Aktifkan atau nonaktifkan kategori auto-skip |
| `n` | Tambah chapter di posisi saat ini |
| `alt+n` | Hapus chapter saat ini |
| `ctrl+n` | Simpan perubahan chapter ke file eksternal |
| `ctrl+→` | Chapter berikutnya, lalu playlist berikutnya |
| `ctrl+←` | Chapter sebelumnya, lalu awal video, lalu playlist sebelumnya |
| `>` | Smart next: silence skip, chapter, atau playlist berikutnya |
| `<` | Smart prev: awal video, chapter, atau playlist sebelumnya |
| `?` | Silence skip sesuai ambang batas yang dikonfigurasi |
| `esc`, `n` | Batalkan silence skip atau countdown auto-skip |
| `enter`, `y` | Lanjutkan countdown auto-skip |

## 7. Riwayat (`SimpleHistory`)

| Tombol | Aksi |
| --- | --- |
| `ctrl+r`, `ctrl+R` | Muat dan lanjutkan file terakhir |
| `alt+r`, `alt+R` | Muat file terakhir dari awal |
| `h`, `H` | Buka panel History, filter semua |
| `r`, `R` | Buka panel History, filter terbaru |
| `ctrl+H` | Toggle mode incognito, file tidak masuk riwayat |

## 8. Bookmark (`SimpleBookmark`)

| Tombol | Aksi |
| --- | --- |
| `ctrl+b`, `ctrl+B` | Simpan bookmark beserta posisi |
| `alt+b`, `alt+B` | Simpan bookmark tanpa posisi |
| `b`, `B` | Buka panel Bookmark, filter semua |
| `k`, `K` | Buka panel Bookmark, filter slot tombol |
| `alt+1` sampai `alt+9` | Simpan ke slot atau muat isi slot saat panel tertutup |
| `alt+!` sampai `alt+(` | Quick-save ke slot 1 sampai 9 tanpa membuka panel |
| `alt+-`, `alt+_` | Hapus slot di kursor atau semua slot bertanda |
| `ctrl+1` sampai `ctrl+5` | Masukkan ke group TV Shows, Movies, Anime, Anime Movies, Cartoon |
| `ctrl+!`, `ctrl+@`, `ctrl+SHARP`, `ctrl+$` | Masukkan ke group TV Shows, Movies, Anime, Anime Movies |
| `ctrl+g`, `ctrl+G` | Cycle group untuk item di kursor atau bertanda |
| `ctrl+-`, `ctrl+_` | Hapus group dari item di kursor atau bertanda |
| `!`, `@`, `SHARP`, `$`, `%` | Lompat ke group di dalam panel |
| `r`, `R`, `d`, `D`, `f`, `F` | Lompat ke filter recents, distinct, fileonly di dalam panel |

## 9. Clipboard (`SmartCopyPaste_II`)

| Tombol | Aksi |
| --- | --- |
| `ctrl+c`, `ctrl+C`, `meta+c`, `meta+C` | Copy path, URL, atau judul beserta waktu |
| `ctrl+v`, `ctrl+V`, `meta+v`, `meta+V` | Paste path, URL, atau file ke playlist |
| `ctrl+alt+c`, `ctrl+alt+C`, `meta+alt+c`, `meta+alt+C` | Copy khusus sesuai `copy_specific_behavior`, default path |
| `ctrl+alt+v`, `ctrl+alt+V`, `meta+alt+v`, `meta+alt+V` | Paste khusus sesuai `paste_specific_behavior`, default playlist |
| `c`, `C` | Buka panel Clipboard, filter semua |
| `→`, `MBTN_FORWARD` | Filter berikutnya |
| `←`, `MBTN_BACK` | Filter sebelumnya |
| `alt+s`, `alt+S` | Cycle urutan sort |

## 10. Navigasi panel (berlaku saat panel terbuka)

Panel History, Bookmark, dan Clipboard memakai tombol yang sama.

| Tombol | Aksi |
| --- | --- |
| `↑`, `WHEEL_UP` | Naik satu item |
| `↓`, `WHEEL_DOWN` | Turun satu item |
| `PGUP`, `PGDWN` | Item pertama atau terakhir pada halaman |
| `HOME`, `END` | Item pertama atau terakhir pada list |
| `SHIFT` + tombol navigasi | Tandai item saat bergerak |
| `ctrl+a`, `ctrl+A` | Tandai semua item |
| `ctrl+d`, `ctrl+D` | Hapus semua tanda |
| `ENTER`, `MBTN_MID` | Muat item di kursor |
| `CTRL+ENTER` | Tambah item di kursor ke playlist |
| `SHIFT+ENTER` | Tambah semua item bertanda ke playlist |
| `ESC`, `MBTN_RIGHT` | Tutup panel, atau tutup kolom cari lebih dulu |
| `DEL` | Hapus item di kursor dari log |
| `SHIFT+DEL` | Hapus semua item bertanda dari log |
| `ctrl+f`, `ctrl+F` | Buka kolom cari |
| `ALT+ENTER` | Keluar mode ketik, panel tetap terbuka |
| `0` sampai `9` | Muat item ke-1 sampai ke-10, hanya di History dan Clipboard |

## 11. Discord Rich Presence

| Tombol | Aksi |
| --- | --- |
| `D` | Aktifkan atau nonaktifkan Discord RPC |

## 12. Catatan tabrakan tombol

| Tombol | Keterangan |
| --- | --- |
| `CTRL+1` sampai `CTRL+5` | Shader Anime4K dan group Bookmark memakai tombol yang sama. SimpleBookmark memakai forced binding, jadi tombol ini mengubah group. `CTRL+6` dan `CTRL+0` tetap untuk shader. |
| `ctrl+c`, `ctrl+v` | Copy dan paste menggantikan keluar dan buka clipboard bawaan mpv. |
| `ctrl+r` | Riwayat menggantikan reload file bawaan. |
| `?`, `>`, `<` | SmartSkip menggantikan daftar tombol dan navigasi playlist bawaan. |
| `ESC`, `ENTER`, `n`, `y` | Dipakai SmartSkip saat countdown atau silence skip aktif, dan dipakai panel saat panel terbuka. |
| `f`, `r`, `b`, `c`, `k`, `d`, `h` | Menjadi tombol lompat filter saat panel terkait terbuka, menggantikan aksi bawaan. |
| `PGUP`, `PGDWN`, `HOME`, `DEL`, `0` sampai `9` | Menjadi navigasi panel saat panel terbuka. |
| `ctrl+H` dan `ctrl+h` | Berbeda, tidak bentrok. `ctrl+h` tetap toggle hardware decoding. |

Sumber binding: `portable_config/input.conf`, `portable_config/script-opts/*.conf`, dan `portable_config/scripts/*.lua`. Shortcut bawaan mpv diambil dari `etc/input.conf` upstream.
