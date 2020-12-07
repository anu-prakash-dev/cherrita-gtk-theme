project('Cherrita', default_options: ['prefix=/usr'])

sassc = find_program('sassc')
gnome = import('gnome')

theme_name = meson.project_name()
prefix = get_option('prefix')
root_themedir = join_paths(get_option('datadir'), 'themes')
gnome_shell_themedir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')

subdir('gnome-shell')
subdir('gtk-3.0')
subdir('metadata')
