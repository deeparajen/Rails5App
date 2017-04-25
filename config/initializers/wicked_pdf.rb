platform = RUBY_PLATFORM 
### wkhtmltopdf 0.9.9 static binary files
if platform.include?("darwin") # OS X machine 
  binary_path = Rails.root.join('bin', 'wkhtmltopdf-i386').to_s 
elsif platform.include?("64-linux") # 64-bit linux machine 
  binary_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s 
end 

WickedPdf.config = { 
  :exe_path => binary_path,
  :orientation => 'Landscape',
  :page_size => 'A4',
  :disable_external_links => true,
  :disable_internal_links => true,
  :print_media_type => true
  
 } 