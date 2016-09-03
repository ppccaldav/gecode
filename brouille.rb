require 'rubygems'
require 'gecoder'


class  Brouille
 	include Gecode::Mixin

  def initialize 
 		#dispoprofs
   duree=[3,4,6]
 		coursdebut_is_an int_var_array(3,0..40)
 		d=duree[2]
 		nbr_cours = coursdebut.size - 1
 		nbr_cours.times do |i|
 		  [i..nbr_cours].each do |j| 
 		  	puts "i:#{i}, j:#{j}\n"
 		    no_overlap(coursdebut[i], d, coursdebut[j], d)
 		  end
 		end  
 		branch_on coursdebut
 		solve!
    puts coursdebut.values.join(' ,')
  end 

  def no_overlap(x1,w1,x2,w2) 
    ((x1 + w1).must <= x2) | ((x2 + w2).must <= x1)
  end

end

Brouille.new
