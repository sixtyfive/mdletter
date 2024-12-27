task :default do; system 'rake build'; end

desc 'rm *.pdf *.html *.log'
task :clean do
  cmd = "rm -f *.{log,pdf,html}"
  puts cmd
  system cmd
end

def sensible_browser_binary
  require 'mkmf'
  binary_names = %w[google-chrome google-chrome-stable chromium chromium-browser google-chrome-beta google-chrome-dev]
  in_path = binary_names.map{find_executable _1}.compact
  raise 'No usable Chrome-ish binary found. Please install Chromium or Google Chrome!' unless in_path.any?
  in_path.first
end

desc 'md => html => pdf'
task :all do
  @chromish = sensible_browser_binary
  Dir['*.md'].each do |md|
    next if %w[README.md NOTES.md].include? md

    name = md.split('.').first
    css1 = "templates/#{name}/screen.css"
    css2 = "templates/#{name}/mobile.css"
    css3 = "templates/#{name}/print.css"
    layout = "templates/#{name}/layout.html"
    raise "Missing template folder ('./templates/#{name}/') for input file '#{md}'!" unless Dir.exist? File.join('templates',name)
    
    puts "\e[1;34m#{md} => #{name}.html\e[0m"
    cmd = "pandoc #{md} -o #{name}.html --standalone --css #{css1} --css #{css2} --css #{css3} --template #{layout}"
    puts cmd
    system cmd
    
    puts "\e[1;34m#{md} => #{name}.pdf\e[0m"
    cmd = "#{@chromish} --headless --disable-gpu --no-pdf-header-footer --no-margins --print-to-pdf=#{name}.pdf #{name}.html"
    puts cmd
    system cmd
  end
end

desc '*.pdf => single file'
task :collate do
  outname = 'collation.pdf'
  infiles = Dir['*.pdf'] - [outname]
  cmd = "gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=\"#{outname}.pdf\" #{infiles.sort.join(' ')}"
  puts cmd
  system cmd
end
