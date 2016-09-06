require 'rubygems'
require 'gecoder'


class  Brouille
 	include Gecode::Mixin

  def initialize 
 		#dispoprofs
   duree=[3,4,6]
   dispoprofs=[[0,20],[48,68],[88,100]]
 		coursdebut_is_an int_var_array(3,0..200)
 		d=duree[2]
 		#nbr_cours = coursdebut.size - 1
 		#nbr_cours.times do |i|
 		 #[i..nbr_cours].each do |j| 
 		  	#puts "i:#{i}, j:#{j}\n"
 		    #no_overlap(coursdebut[i], d, coursdebut[j], d)
 		    #puts "i:#{i}, j:#{j}\n" 
 		    #no_overlap(coursdebut[1],d,coursdebut[2],d)
 		    #no_overlap(coursdebut[2],d,coursdebut[0],d)
 		    no_overlap(coursdebut[0],d,coursdebut[1],d) 
 		    no_overlap(coursdebut[1],d,coursdebut[2],d)
 		    no_overlap(coursdebut[0],d,coursdebut[2],d)
 		    include(dispoprofs,coursdebut[0])
 		    include(dispoprofs,coursdebut[1])
 		    include(dispoprofs,coursdebut[2])
        

       
 		  #end
 		#end  
 		branch_on coursdebut
 		solve!
    puts coursdebut.values.join(' ,')
  end 

  def no_overlap(x1,w1,x2,w2) 
    ((x1 + w1).must <= x2 || (x2+w2).must <= x1)

  end
  def include (tab,x)
  	((x.must>=tab[0][0]) && (x.must<=tab[0][1])) ||((x.must>=tab[1][0]) && (x.must<=tab[1][1])) || ((x.must>=tab[2][0]) && (x.must<=tab[2][1]))
  end

end

Brouille.new
