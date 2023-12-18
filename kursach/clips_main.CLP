(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer))))
   ?answer
)
(deffunction yes-or-no (?question)
(bind ?response (ask-question ?question yes no y n))
(if (or (eq ?response yes) (eq ?response y))
then TRUE else FALSE))

(defrule What_science_do_you_want_to_study?
   =>
   (bind ?response (ask-question "What_science_do_you_want_to_study?(technic/humanitarian)" technic humanitarian))
(if (eq ?response technic)
   then
     	(undefrule Do_you_want_to_study_laws?)
	(undefrule Do_you_want_to_study_judgment?)
	(undefrule Do_you_want_to_study_web_design?)
	(undefrule Do_you_want_to_study_landscape_design?)
	(undefrule Do_you_want_to_study_graphic_design?)
	(undefrule Do_you_want_to_study_design?)
	
     (printout t crlf
               	"------" crlf
	       	"technic " crlf
               	"------" crlf)
   else
(if (eq ?response humanitarian)
      then
	(undefrule Do_you_want_to_study_frontend?)
	(undefrule Do_you_want_to_study_databases?)
	(undefrule Do_you_want_to_study_backend?)
	(undefrule Do_you_want_to_study_documentation?)	
	(undefrule Do_you_want_to_study_Programming?)

     (printout t crlf
               	"------" crlf
		"humanitarian" crlf
               	"------" crlf)
	)) 
)

(defrule Do_you_want_to_study_design?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_design?(yes/no)")
   then
     	(assert (GraphicDesign))
	(undefrule Do_you_want_to_study_laws?)
	(undefrule Do_you_want_to_study_judgment?)
     (printout t crlf
               	"------" crlf
		"Graphic Design" crlf
               	"------" crlf)
   else
	(assert (Judgement))
	(undefrule Do_you_want_to_study_web_design?)
	(undefrule Do_you_want_to_study_landscape_design?)
	(undefrule Do_you_want_to_study_graphic_design?)
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)   
   )
)


(defrule Do_you_want_to_study_graphic_design?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_graphic_design?(yes/no)")
   then
     	(assert(GraphicDesign))
	(undefrule Do_you_want_to_study_web_design?)
	(undefrule Do_you_want_to_study_landscape_design?)
     (printout t crlf
               	"------" crlf
		"Graphic Design" crlf
               	"------" crlf)
   else
	(assert (AI))
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)   
   )
)
(defrule Do_you_want_to_study_landscape_design?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_landscape_design?(yes/no)")
   then
     	(undefrule Do_you_want_to_study_web_design?)
     (printout t crlf
               	"------" crlf
		"you should study landscape design" crlf
               	"------" crlf)
   else
	
     (printout t crlf
               	"------" crlf
		"no" crlf
               	"------" crlf)   
   )
)


(defrule Do_you_want_to_study_web_design?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_web_design?(yes/no)")
   then
     	
     (printout t crlf
               	"------" crlf
		"you should study Web design" crlf
               	"------" crlf)
   else
	(assert (Beans))
     (printout t crlf
               	"------" crlf
		"you should study architecture design" crlf
               	"------" crlf)   
   )
)

(defrule Do_you_want_to_study_laws?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to study_laws?(yes/no)")
   then
     	(assert (Judgement))
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)
   else
     (assert (Syntax))
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)
	))
)

(defrule Do_you_want_to_study_judgment?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_judgment?(yes/no)")
   then
     	(assert (Judgement))
     (printout t crlf
               	"------" crlf
		"Judgement" crlf
               	"------" crlf)
   else
	(assert (AdminRight))
	(undefrule Do_you_want_to_study_web_design?)
	(undefrule Do_you_want_to_study_landscape_design?)
	(undefrule Do_you_want_to_study_graphic_design?)
     (printout t crlf
               	"------" crlf
		"AdminRights" crlf
               	"------" crlf)   
   )
)

(defrule Do_you_want_to_study_Programming?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_Programming?(yes/no)")
   then
     	(assert (StudyBackEnd))
     (printout t crlf
               	"------" crlf
		"" crlf
               	"------" crlf)
   else
	(assert (Math))
	(undefrule Do_you_want_to_study_frontend?)
	(undefrule Do_you_want_to_study_databases?)
	(undefrule Do_you_want_to_study_backend?)
     (printout t crlf
               	"------" crlf
		"Mathematic" crlf
               	"------" crlf)   
   )
)
(defrule Do_you_want_to_study_documentation?
   =>
   (bind ?response (ask-question "Do_you_want_to_study_documentation?(yes/no)" yes no))
(if (eq ?response yes)
   then
     	(assert (DevOps))
     	(printout t crlf
               	"------" crlf
	       	"Back-end" crlf
               	"------" crlf)
   else
(if (eq ?response no)
then
      (assert (PM))
     (printout t crlf
               	"------" crlf
		"Project managment" crlf
               	"------" crlf)
	)) 
)

(defrule Do_you_want_to_study_backend?
   =>
   (bind ?response (ask-question "Do_you_want_to_study_backend?(yes/no)" yes no))
(if (eq ?response yes)
   then
     	(assert (StudyBackEnd))
	(undefrule Do_you_want_to_study_frontend?)
	(undefrule Do_you_want_to_study_databases?)
     	(printout t crlf
               	"------" crlf
	       	"Back-end" crlf
               	"------" crlf)
   else
(if (eq ?response no)
then
      (assert (FrontEnd))
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)
	)) 
)

(defrule Do_you_want_to_study_frontend?
  (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_frontend?(yes/no)")
   then
     	(assert (StudyFrontEnd))
	(undefrule Do_you_want_to_study_databases?)
     	(printout t crlf
               	"------" crlf
	       	"FrontEnd" crlf
               	"------" crlf)
   else
	(assert (BDDev))
     (printout t crlf
               	"------" crlf
		" " crlf
               	"------" crlf)
	)) 
)

(defrule Do_you_want_to_study_databases?
   (initial-fact)
   =>
   (if(yes-or-no "Do_you_want_to_study_databases?(yes/no)")
   then
     	(assert (BDDev))
     (printout t crlf
               	"------" crlf
		"Databases" crlf
               	"------" crlf)
   else
	(assert (WebDev))
     (printout t crlf
               	"------" crlf
		"WebDev" crlf
               	"------" crlf)   
   )
)

(defrule choice_Judgement
	(Judgement)	
   =>
     	(printout t "you should study Judgement" crlf)
)
(defrule choice_AdminRight
	(AdminRight)	
   =>
     	(printout t "you should study administrative rights" crlf)
)

(defrule choice_Painter
	(Painter)	
   =>
     	(printout t "you should study painting" crlf)
)
(defrule choice_3D
	(3D)	
   =>
     	(printout t "you should study 3D modelling" crlf)
)
(defrule choice_WebDesign
	(WebDesign)	
   =>
     	(printout t "you should study web design" crlf)
)
defrule choice_LandDesign
	(LandDesign)	
   =>
     	(printout t "you should study landscape design" crlf)
)
(defrule choice_GraphicDesign
	(GraphicDesign)	
   =>
     	(printout t "you should study Graphic Design" crlf)
)
(defrule choice_MathComp
	(MathComp)	
   =>
     	(printout t "you should study math in computer science" crlf)
)
(defrule choice_Math
	(Math)	
   =>
     	(printout t "you should study math" crlf)
)
(defrule choice_MathAnalys
	(MathAnalys)	
   =>
     	(printout t "you should study math analystic" crlf)
)
(defrule choice_Tester
	(Tester)	
   =>
     	(printout t "you should study autotesting" crlf)
)
(defrule choice_Admin
	(Admin)	
   =>
     	(printout t "you should study administration" crlf)
)
(defrule choice_PM
	(PM)	
   =>
     	(printout t "you should study project managment" crlf)
)
(defrule choice_DevOps 
	(DevOps)	
   =>
     	(printout t "you should study DevOps" crlf)
)
(defrule choice_WebDev
	(WebDev)	
   =>
     	(printout t "you should study Web-development" crlf)
)
(defrule choice_BDDev
	(BDDev)	
   =>
     	(printout t "you should study databases" crlf)
)
(defrule choice_StudyFrontEnd
	(StudyFrontEnd)	
   =>
     	(printout t "you should study Front-end " crlf)
)
(defrule choice_StudyBackEnd
	(StudyBackEnd)	
   =>
     	(printout t "you should study Back-end" crlf)
)
(defrule choice_PRG
	(PRG)	
   =>
     	(printout t "you should study programming" crlf)
)
