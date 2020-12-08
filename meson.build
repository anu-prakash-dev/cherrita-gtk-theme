project('Cherrita', default_options: ['prefix=/usr'])

sassc = find_program('sassc')
gnome = import('gnome')

theme_name = meson.project_name()
prefix = get_option('prefix')
root_themedir = join_paths(get_option('datadir'), 'themes')
gnome_shell_themedir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')

subdir('metadata')

if get_option('gnome-shell')
    subdir('gnome-shell')
endif
if get_option('gtk')
    subdir('gtk-2.0')
    subdir('gtk-3.0')
endif
