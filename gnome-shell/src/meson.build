theme_deps = []
style_css = []
output_styles = []

compile_gresource = get_option('gnome-shell-gresource')
gnome_shell_oldthemedir = join_paths(root_themedir, theme_name, 'gnome-shell')

theme_sources = files([
	run_command(
    	'find', meson.current_source_dir(), '-name', '*.scss'
	).stdout().strip().split('\n')
])

assets_sources = files([
	'pad-osd.css',
	run_command(
    	'find', meson.current_source_dir(), '-name', '*.svg'
	).stdout().strip().split('\n')
])

styles = [
	'gnome-shell-high-contrast',
	'gnome-shell'
]

foreach style: styles
	stylename = style
	output_styles += '@0@.css'.format(style)

	style_css += custom_target(
		'style-@0@'.format(stylename),
		input: '@0@.scss'.format(style),
		output: '@0@.css'.format(stylename),
		command: [
			sassc, '-a', '@INPUT@', '@OUTPUT@',
			'-I', meson.current_source_dir(),
		],
		install: not compile_gresource,
		install_dir: gnome_shell_oldthemedir,
		depend_files: theme_sources,
	)
endforeach

if compile_gresource
	gresource_xml = files('gnome-shell-theme.gresource.xml')[0]
	gresource_installdir = join_paths(gnome_shell_themedir, theme_name)
	gnome.compile_resources(
		'gnome-shell-theme',
		gresource_xml,
		dependencies: style_css,
		gresource_bundle: true,
		install: true,
		install_dir: gresource_installdir,
	)
else
	# install assets
	install_data(assets_sources, install_dir: gnome_shell_oldthemedir)
	meson.add_install_script('fix-asset-link.sh', meson.project_name())
endif
