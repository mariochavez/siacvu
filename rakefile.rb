COMPILE_TARGET = "debug"
CLR_VERSION = "v3.5"
SOLUTION = "DI.Colef.Sia.sln"
OUTPUT = "app/DI.Colef.Sia.Web"

require "BuildLibs/BuildUtils.rb"
require 'rubygems'
require 'fileutils'

include FileUtils

props = { :archive => "build" }
task :default => ["build:all"]
 
namespace :build do
  
  task :all => [:clean, :compile, :harvest]
  
  desc "Prepares the working directory for a new build"
  task :clean do
    #TODO: do any other tasks required to clean/prepare the working directory
    Dir.mkdir props[:archive] unless Dir.exists?(props[:archive])
  end
  
  desc "Use MSBuild to build the solution"
  task :compile => [:clean] do
    MSBuildRunner.compile :compilemode => COMPILE_TARGET, :solutionfile => SOLUTION, :clrversion => CLR_VERSION
    
    
  end
  
  desc "Harvest build outputs to: '#{pwd}\\#{OUTPUT}'"
  task :harvest do
    cp_r "#{OUTPUT}/bin", props[:archive]
    cp_r "#{OUTPUT}/Content", props[:archive]
    cp_r "#{OUTPUT}/Views", props[:archive]
    cp_r "#{OUTPUT}/Scripts", props[:archive]
    
    copy("#{OUTPUT}/Default.aspx", props[:archive])
    copy("#{OUTPUT}/Global.asax", props[:archive])
    copy("#{OUTPUT}/NHvalidator.config", props[:archive])
    copy("#{OUTPUT}/Web.config", props[:archive])
    
    copy("db/CleanDBSchema.sql", props[:archive])
    copy("db/inicializacion.sql", props[:archive])
    copy("db/CatalogosConacyt1.sql", props[:archive])
    copy("db/CatalogosConacyt2.sql", props[:archive])
    copy("db/CatalogosConacyt3.sql", props[:archive])
    copy("db/CatalogosConacyt4.sql", props[:archive])
    copy("db/CatalogosConacyt5.sql", props[:archive])
    copy("db/CatalogosConacyt6.sql", props[:archive])
    copy("db/CatalogosConacyt7.sql", props[:archive])
    copy("db/CatalogosConacyt8.sql", props[:archive])
    copy("db/CatalogosConacyt9.sql", props[:archive])
    copy("db/CatalogosConacyt10.sql", props[:archive])
    copy("db/CatalogosConacyt11.sql", props[:archive])
    copy("db/CatalogosConacyt12.sql", props[:archive])
    
  end
 
  #desc "Executes class specifications (BDD)"
  #task :test => [:harvest] do
  #  specs = Dir.glob(File.join("#{PACKAGE_PATH}", "*.Specs.dll")).join " "
  #  xml_file = File.join(PACKAGE_PATH, "nunit-test-report.xml")
  #  sh "#{NUNIT_PATH} #{specs} /nologo /xml=#{xml_file}"
  #end
  
end