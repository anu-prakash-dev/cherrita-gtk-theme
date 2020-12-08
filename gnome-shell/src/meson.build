compile_gresource = get_option('gnome-shell-gresource')

theme_sources = files([
	'gnome-shell-high-contrast.scss',
	'gnome-shell.scss',
	'gnome-shell-sass/_colors.scss',
	'gnome-shell-sass/_common.scss',
	'gnome-shell-sass/_drawing.scss',
	'gnome-shell-sass/_high-contrast-colors.scss',
	'gnome-shell-sass/_widgets.scss',
	'gnome-shell-sass/widgets/_a11y.scss',
	'gnome-shell-sass/widgets/_app-grid.scss',
	'gnome-shell-sass/widgets/_base.scss',
	'gnome-shell-sass/widgets/_buttons.scss',
	'gnome-shell-sass/widgets/_calendar.scss',
	'gnome-shell-sass/widgets/_check-box.scss',
	'gnome-shell-sass/widgets/_corner-ripple.scss',
	'gnome-shell-sass/widgets/_dash.scss',
	'gnome-shell-sass/widgets/_dialogs.scss',
	'gnome-shell-sass/widgets/_entries.scss',
	'gnome-shell-sass/widgets/_hotplug.scss',
	'gnome-shell-sass/widgets/_ibus-popup.scss',
	'gnome-shell-sass/widgets/_keyboard.scss',
	'gnome-shell-sass/widgets/_login-dialog.scss',
	'gnome-shell-sass/widgets/_looking-glass.scss',
	'gnome-shell-sass/widgets/_message-list.scss',
	'gnome-shell-sass/widgets/_misc.scss',
	'gnome-shell-sass/widgets/_network-dialog.scss',
	'gnome-shell-sass/widgets/_notifications.scss',
	'gnome-shell-sass/widgets/_osd.scss',
	'gnome-shell-sass/widgets/_overview.scss',
	'gnome-shell-sass/widgets/_panel.scss',
	'gnome-shell-sass/widgets/_popovers.scss',
	'gnome-shell-sass/widgets/_screen-shield.scss',
	'gnome-shell-sass/widgets/_scrollbars.scss',
	'gnome-shell-sass/widgets/_search-entry.scss',
	'gnome-shell-sass/widgets/_search-results.scss',
	'gnome-shell-sass/widgets/_slider.scss',
	'gnome-shell-sass/widgets/_switcher-popup.scss',
	'gnome-shell-sass/widgets/_switches.scss',
	'gnome-shell-sass/widgets/_tiled-previews.scss',
	'gnome-shell-sass/widgets/_window-picker.scss',
	'gnome-shell-sass/widgets/_workspace-switcher.scss',
	'gnome-shell-sass/widgets/_workspace-thumbnails.scss',
	'overlay/_colors.scss',
	'overlay/_common.scss',
	'overlay/_widgets.scss',
	'overlay/widgets/_app_grid.scss',
	'overlay/widgets/_calendar.scss',
	'overlay/widgets/_dash.scss',
	'overlay/widgets/_login-dialog.scss',
	'overlay/widgets/_panel.scss'
])

assets_sources = files([
	'pad-osd.css',
	'calendar-today.svg',
	'checkbox-off.svg',
	'checkbox-focused.svg',
	'checkbox-off-focused.svg',
	'checkbox.svg',
	'color-pick.svg',
	'dash-placeholder.svg',
	'eye-not-looking-symbolic.svg',
	'eye-open-negative-filled-symbolic.svg',
	'keyboard-caps-lock-filled-symbolic.svg',
	'keyboard-enter-symbolic.svg',
	'keyboard-hide-symbolic.svg',
	'keyboard-layout-filled-symbolic.svg',
	'keyboard-shift-filled-symbolic.svg',
	'message-indicator-symbolic.svg',
	'no-events.svg',
	'no-notifications.svg',
	'pointer-double-click-symbolic.svg',
	'pointer-drag-symbolic.svg',
	'pointer-primary-click-symbolic.svg',
	'pointer-secondary-click-symbolic.svg',
	'process-working.svg',
	'running-indicator.svg',
	'toggle-off-dark.svg',
	'toggle-off-hc.svg',
	'toggle-off.svg',
	'toggle-on-hc.svg',
	'toggle-on-dark.svg',
	'toggle-on.svg',
])
styles = [
	'gnome-shell-high-contrast',
	'gnome-shell'
]

theme_deps = []

css_sources_path = meson.current_source_dir()

style_css = []
output_styles = []

gnome_shell_oldthemedir = join_paths(root_themedir, theme_name, 'gnome-shell')
foreach style: styles
	stylename = style
	output_styles += '@0@.css'.format(style)

	style_css += custom_target(
		'style-@0@'.format(stylename),
		input: '@0@.scss'.format(style),
		output: '@0@.css'.format(stylename),
		command: [
			sassc, '-a', '@INPUT@', '@OUTPUT@',
			'-I', css_sources_path,
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
