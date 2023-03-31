task :default do; system 'rake -T'; end

desc 'rm *.pdf *.html'
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
task :build do
  @chromish = sensible_browser_binary
  Dir['*.md'].each do |md|
    next if %w[README.md NOTES.md].include? md
    print "#{md} => "
    html = md.gsub(/\.md/, '.html')
    css  = md.gsub(/\.md/, '.css')
    tpl  = md.gsub(/\.md/, '.template.html')
    pdf  = md.gsub(/\.md/, '.pdf')
    raise "No template file '#{tpl}' present for input file '#{md}'!" unless File.exist? File.join('templates',tpl)
    `pandoc #{md} -o #{html} --css templates/#{css} --template templates/#{tpl} --standalone`
    print "#{html} "
    `#{@chromish} --headless --disable-gpu --print-to-pdf-no-header --no-margins --print-to-pdf=#{pdf} #{html}`
    print "#{pdf}\n"
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
