// https://medium.com/@hoffa/open-source-boards-and-tenure-terms-e8cadb02035

with sheet4 as (
select $1 f, $2 x
from (values('fsf', 'Richard Stallman					1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1		1
Geoffrey Knauth					1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
Gerald Sussman					1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
Henry Poole							1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
Eben Moglen						1	1	1	1	1	1														
Lawrence Lessig								1	1	1	1														
Benjamin Mako Hill											1	1	1	1	1	1	1	1	1	1	1	1	1		
Hal Abelson												1	1	1	1	1	1	1	1	1	1				
Bradley Kuhn																1	1	1	1	1	1	1	1		
Peter Brown													1	1	1										
Matthew Garrett																			1	1					
Kat Walsh																			1	1	1	1	1	1	
Alexandre Oliva 																							1	1	
Ian Kelling																									1
Odile Bénassy																									1'), ('python', 'David Ascher						1	1	1	1	1	1	1													
Paul Everitt						1																			
Fredrik Lundh						1																			
Tim Peters						1	1	1	1	1	1	1	1	1	1	1	1	1							
Guido van Rossum						1	1	1	1																
Greg Stein						1									1	1									
Thomas Wouters						1	1	1														1	1		1
Jeremy Hylton							1	1	1	1															
Marc-André Lemburg							1	1							1	1	1	1	1	1					
Martin von Löwis							1	1	1	1	1	1	1	1	1	1	1								
Stephan Deibel									1	1	1	1	1												
Steve Holden									1	1	1	1	1	1	1	1	1								
Andrew Kuchling										1	1	1		1			1								
Brett Cannon											1	1	1	1				1							
David Goodger											1	1	1												
Raymond Hettinger													1	1	1	1									
James Tauber													1	1	1	1									
David Mertz														1	1	1	1	1	1						
Jeff Rush														1	1	1									
Doug Napoleone															1	1	1	1							
Jesse Noller															1	1	1	1							
Allison Randal															1	1									
Gloria Willadsen															1	1									
Brian Curtin																	1	1	1						
Van Lindberg																	1	1	1	1	1	1	1	1	1
Jessica McKellar																	1	1	1						
Alex Gaynor																		1	1	1					
Lynn Root																		1	1	1					
Nick Coghlan																			1	1					
Kushal Das																			1		1	1	1	1	1
Selena Decklemann																			1						
Travis Oliphant																			1						
Naomi Ceder																				1	1	1	1	1	
Diana Clarke																				1	1				
Ashwini Oruganti																				1					
Anna Ossowski																				1			1	1	1
Carrie Ann Philbin																				1	1				
Carol Willing																				1	1				
Annapoornima Koppad																					1				
Jacqueline Kazil																					1	1	1	1	1
Lorena Mesa																					1	1	1	1	
Trey Hunner																					1	1			
Younggun Kim																					1				
Eric Holscher																						1	1	1	
Paul Hildebrandt																						1			
Marlene Mhangami																						1	1	1	1
Kenneth Reitz																						1			
Ewa Jodlowska																						1	1	1	1
Paola Katherine Pacheco																						1			
Christopher Neugebauer																							1	1	1
Jeff Triplett																							1	1	1
Katie McLaughlin																							1	1	1
Jannis Leidel																								1	1
Nina Zakharenko																									1
Dustin Ingram																									1
'), ('apache', 'Brian Behlendorf					1	1	1																	
Ken Coar					1	1	1	1	1	1														
Roy T. Fielding					1	1	1						1	1	1	1	1							1
Jim Jagielski					1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1			
Ben Laurie					1	1	1		1															
Bill Stoddard					1																			
Randy Terbush					1	1																		
Dirk-Willem van Gulik					1	1	1	1	1	1														
Greg Stein					1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1				
Bill Stoddard					1																			
Sam Ruby						1	1	1	1	1	1	1		1	1	1	1	1	1					1
Mark Cox							1																	
Geir Magnusson Jr.								1			1	1	1											
Stefano Mazzocchi								1	1															
Sander Striker								1	1	1														1
Justin Erenkrantz									1	1	1	1	1											
Cliff Schmidt										1														
Henri Yandell										1	1			1										
J Aaron Farr											1	1												
William Rowe Jr.											1	1												
Henning Schmiedehausen											1	1												
Bertrand Delacretaz												1		1	1	1	1	1	1	1	1	1		1
Shane Curcuru													1	1	1		1		1	1	1	1	1	1
Doug Cutting													1	1	1	1	1	1						
Brian McCallister													1											
Brett Porter													1		1	1	1	1	1	1	1	1		
Noirin Shirley														1										
Lawrence Rosen															1									
Rich Bowen																1		1	1		1	1	1	
Ross Gardler																1		1						
Chris Mattmann																	1	1	1	1	1			
David Nalley																			1					
Isabel Drost-Fromm																				1		1		
Marvin Humphrey																				1				
Mark Thomas																				1	1	1		
Phil Steitz																					1	1		
Ted Dunning																					1	1	1	
Roman Shaposhnik																						1	1	
Danny Angus																							1	
Myrle Krantz																							1	
Daniel Ruggeri																							1	
Craig L Russell																							1	1
Joan Touzet																							1	
Niclas Hedhman																								1
Justin Mclean																								1
Patricia Shanahan																								1')
,  (
    'osi', 'Matt Asay												1													
Ken Coar												1	1	1											
Danese Cooper												1	1	1											
Bruno Souza												1	1	1				1	1	1					
Rishab Aiyer Ghosh												1	1												
Raj Mathur												1													
Russell Nelson												1	1	1											
Nnenna Nwakanma												1	1	1											
Alolita Sharma												1	1	1	1	1	1								
Michael Tiemann 												1	1	1	1	1									
Harshad Gune													1	1	1	1	1	1							
Martin Michlmayr													1	1	1	1	1	1							
Andrew C. Oliver														1	1	1									
Karl Fogel															1	1	1	1							
Mike Godwin															1	1									
Jim Jagielski															1	1	1								
Fabio Kon															1	1	1								
Simon Phipps															1	1	1	1	1	1		1	1	1	
Tony Wasserman															1	1	1	1	1	1					
Deborah Bryant																	1	1	1	1	1			1	1
Mike Milinkovich																	1	1	1	1	1				
Luis Villa																	1	1	1						
Richard Fontana																		1	1	1	1	1	1		
Patrick Masson																		1	1	1	1	1	1	1	
Leslie Hawthorn																			1	1	1				
Alison Randal																			1	1	1	1	1		
Stefano Zacchiroli																			1	1	1				
Paul Tagliamonte																				1	1				
Molly de Blanc																					1	1	1	1	
Josh Simmons																					1	1	1	1	1
Italo Vignoli																					1	1	1		1
VM Brasseur																						1			
Chris Lamb																						1	1	1	1
Faidon Liambotis																						1	1	1	1
Carol Smith																						1	1		
Pamela Chestek																								1	1
Hong Phuc Dang																								1	1
Elana Hashman																								1	1
Tracy Hinds																								1	1
Megan Byrd-Sanicki																									1'
))),
unpivot as (
    select f
        , split(y.value, '\t')[0]::string who, z.index+2000-5 year
        , row_number() over(partition by f, who order by year) years_served
    from sheet4
        , table(split_to_table(x, '\n')) y
        , table(split_to_table(y.value, '\t')) z 
    where z.index>5
    and z.value='1'
)

-- select *
-- from unpivot;

select f, year, avg(years_served)
from unpivot
group by 1,2
order by 1,2

;
