DOT_NET_PATH = "C:/Windows/Microsoft.NET/Framework/v3.5/"
NUNIT_PATH = "tools//nunit-2.4.6//nunit-console.exe"
PACKAGE_PATH = "build"
SOLUTION = "DI.Colef.Sia.sln"
CONFIG = "Debug"

task :default => ["build:all"]
 
namespace :build do
  
  task :all => [:compile, :harvest, :test]
  
  desc "Use MSBuild to build the solution: '#{SOLUTION}'"
  task :compile do
    sh "#{DOT_NET_PATH}msbuild.exe /p:Configuration=#{CONFIG} #{SOLUTION}"
  end
  
  desc "Harvest build outputs to: '#{pwd}\\#{PACKAGE_PATH}'"
  task :harvest => [:compile] do
    require 'build/scripts/file_handling.rb'
    package_files
  end
 
  desc "Executes class specifications (BDD)"
  task :test => [:harvest] do
    specs = Dir.glob(File.join("#{PACKAGE_PATH}", "*.Specs.dll")).join " "
    xml_file = File.join(PACKAGE_PATH, "nunit-test-report.xml")
    sh "#{NUNIT_PATH} #{specs} /nologo /xml=#{xml_file}"
  end
  
end