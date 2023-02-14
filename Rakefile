task :default do; system 'rake -T'; end

desc 'rm *.pdf *.html'
task :clean do
  rm_f '*.pdf' if Dir['*.pdf'].any?
  rm_f '*.html' if Dir['*.html'].any?
end

desc 'md => html => pdf'
task :build do
  Dir['*.md'].each do |md|
    next if %w[README.md NOTES.md].include? md
    print "#{md} => "
    html = md.gsub(/\.md/, '.html')
    css  = md.gsub(/\.md/, '.css')
    tpl  = md.gsub(/\.md/, '.template.html')
    pdf  = md.gsub(/\.md/, '.pdf')
    `pandoc #{md} -o #{html} --css templates/#{css} --template templates/#{tpl} --standalone`
    print "#{html} "
    `chromium --headless --print-to-pdf-no-header --no-margins --print-to-pdf=#{pdf} #{html} >/dev/null 2>&1`
    print "#{pdf}\n"
  end
end

desc '*.pdf => single file'
task :collate do
  files = %w[letter cv-de abschlusszeugnis-berufsschule abizeugnis pruefungszeugnis-uni]
  outname = 'Bewerbung Jonathan Schmid'
  cmd = "gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=\"#{outname}.pdf\" #{files.map{|f| '"'+f+'.pdf"'}.join(' ')}"
  puts cmd
  system cmd
end
