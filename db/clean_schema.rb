s = File.open('DBSchema.sql')
o = File.new('CleanDBSchema.sql', 'w')

statement = ""

s.collect do |line|
  nocodeline = line.match(/^\s+$/)
  
  if(nocodeline)
    invalidrow = statement.match(/alter table (.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)Usuarios/)
    invalidrow = statement.match(/alter table (.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)Alumnos/) unless !invalidrow.nil?
    invalidrow = statement.match(/alter table Alumnos(.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)references(.*)/) unless !invalidrow.nil?

    if(invalidrow == nil)
      createtable = statement.match(/^.*create table Usuarios/)
      createtable = statement.match(/^.*create table Alumnos/) unless !createtable.nil?
      if(createtable == nil)
        o.puts statement
        o.puts "\n"
      end
    end
    statement = ""
  else
    statement =  statement + line
  end
  
end

    invalidrow = statement.match(/alter table (.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)Usuarios/)
    invalidrow = statement.match(/alter table (.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)Alumnos/) unless !invalidrow.nil?
    invalidrow = statement.match(/alter table Alumnos(.*)\n(.*)add(.*)\n(.*)foreign(.*)\n(.*)references(.*)/) unless !invalidrow.nil?

    if(invalidrow == nil)
      o.puts statement
      o.puts "\n"
    end


o.close
s.close