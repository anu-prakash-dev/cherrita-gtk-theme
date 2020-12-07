gnome = import('gnome')
sassc = find_program('sassc')

gtk3_variant = [
  'gtk-dark',
  'gtk',
]

gtk3_scss_dependencies = [
  '_colors-public.scss',
  '_colors.scss',
  '_properties.scss',
  '_common.scss',
  '_drawing.scss',
]

gtk3_assets = [
  'bullet-symbolic.svg',
  'bullet-symbolic.symbolic.png',
  'bullet@2-symbolic.symbolic.png',
  'check-symbolic.svg',
  'check-symbolic.symbolic.png',
  'check@2-symbolic.symbolic.png',
  'dash-symbolic.svg',
  'dash-symbolic.symbolic.png',
  'dash@2-symbolic.symbolic.png',
  'slider-horz-scale-has-marks-above-active-dark.png',
  'slider-horz-scale-has-marks-above-active-dark@2.png',
  'slider-horz-scale-has-marks-above-active.png',
  'slider-horz-scale-has-marks-above-active@2.png',
  'slider-horz-scale-has-marks-above-backdrop-dark.png',
  'slider-horz-scale-has-marks-above-backdrop-dark@2.png',
  'slider-horz-scale-has-marks-above-backdrop-insensitive-dark.png',
  'slider-horz-scale-has-marks-above-backdrop-insensitive-dark@2.png',
  'slider-horz-scale-has-marks-above-backdrop-insensitive.png',
  'slider-horz-scale-has-marks-above-backdrop-insensitive@2.png',
  'slider-horz-scale-has-marks-above-backdrop.png',
  'slider-horz-scale-has-marks-above-backdrop@2.png',
  'slider-horz-scale-has-marks-above-dark.png',
  'slider-horz-scale-has-marks-above-dark@2.png',
  'slider-horz-scale-has-marks-above-hover-dark.png',
  'slider-horz-scale-has-marks-above-hover-dark@2.png',
  'slider-horz-scale-has-marks-above-hover.png',
  'slider-horz-scale-has-marks-above-hover@2.png',
  'slider-horz-scale-has-marks-above-insensitive-dark.png',
  'slider-horz-scale-has-marks-above-insensitive-dark@2.png',
  'slider-horz-scale-has-marks-above-insensitive.png',
  'slider-horz-scale-has-marks-above-insensitive@2.png',
  'slider-horz-scale-has-marks-above.png',
  'slider-horz-scale-has-marks-above@2.png',
  'slider-horz-scale-has-marks-below-active-dark.png',
  'slider-horz-scale-has-marks-below-active-dark@2.png',
  'slider-horz-scale-has-marks-below-active.png',
  'slider-horz-scale-has-marks-below-active@2.png',
  'slider-horz-scale-has-marks-below-backdrop-dark.png',
  'slider-horz-scale-has-marks-below-backdrop-dark@2.png',
  'slider-horz-scale-has-marks-below-backdrop-insensitive-dark.png',
  'slider-horz-scale-has-marks-below-backdrop-insensitive-dark@2.png',
  'slider-horz-scale-has-marks-below-backdrop-insensitive.png',
  'slider-horz-scale-has-marks-below-backdrop-insensitive@2.png',
  'slider-horz-scale-has-marks-below-backdrop.png',
  'slider-horz-scale-has-marks-below-backdrop@2.png',
  'slider-horz-scale-has-marks-below-dark.png',
  'slider-horz-scale-has-marks-below-dark@2.png',
  'slider-horz-scale-has-marks-below-hover-dark.png',
  'slider-horz-scale-has-marks-below-hover-dark@2.png',
  'slider-horz-scale-has-marks-below-hover.png',
  'slider-horz-scale-has-marks-below-hover@2.png',
  'slider-horz-scale-has-marks-below-insensitive-dark.png',
  'slider-horz-scale-has-marks-below-insensitive-dark@2.png',
  'slider-horz-scale-has-marks-below-insensitive.png',
  'slider-horz-scale-has-marks-below-insensitive@2.png',
  'slider-horz-scale-has-marks-below.png',
  'slider-horz-scale-has-marks-below@2.png',
]

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
