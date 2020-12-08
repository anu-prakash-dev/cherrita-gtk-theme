gnome = import('gnome')
sassc = find_program('sassc')

gtk3_variant = [
  'gtk-dark',
  'gtk',
]

gtk3_scss_dependencies = run_command(
    'find', meson.current_source_dir(), '-name', '*.scss'
  ).stdout().strip().split('\n')

assets_path = join_paths(meson.current_source_dir(), 'assets')
gtk3_assets = run_command(
    'find', assets_path, '-type', 'f', '-printf', '%f\n'
  ).stdout().strip().split('\n')

# generate .css files
# and install to themes/THEMENAME/gtk-3.20
generated_css = []
foreach f : gtk3_variant
  generated_css += custom_target('Generate ' + f,
      input: f + '.scss',
      output: f + '.gresource.css',
      depend_files: files(gtk3_scss_dependencies),
      command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
  )
endforeach

# Bundle CSS and assets into gtk.gresource
asset_xml = []
foreach f : gtk3_assets
  asset_xml += '<file>assets/@0@</file>'.format(f)
endforeach
conf_data = configuration_data()
conf_data.set('ASSETS', '\n'.join(asset_xml))
gresource_xml = configure_file(
  input: 'gtk.gresource.xml.in',
  output: 'gtk.gresource.xml',
  configuration: conf_data)

gtk3_dir = join_paths(root_themedir, theme_name, 'gtk-3.0')
gnome.compile_resources('gtk', gresource_xml,
  gresource_bundle: true,
  dependencies: generated_css,
  install: true,
  install_dir: gtk3_dir,
)
install_data(['gtk.css', 'gtk-dark.css'], install_dir: gtk3_dir)

# Setup force-dark theme using link
meson.add_install_script('dark-theme-linker.sh', root_themedir, theme_name)
