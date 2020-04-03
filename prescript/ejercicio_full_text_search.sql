create table tv_series(
	id serial primary key,
	title text not null,
	description text not null,
	creator text not null
);

INSERT INTO tv_series(title,description, creator)
values 
('Stranger Things','Stranger Things is an American science fiction, drama-horror web television series created by the Duffer Brothers and released on Netflix...','Duffer Brothers'),
('Breaking Bad','Breaking Bad is an American neo-Western crime drama television series created and produced by Vince Gilligan. The show aired on AMC from January 20, 2008, to September 29, 2013. It was set and filmed in Albuquerque, New Mexico, and tells the story of Walter White (Bryan Cranston), an underemployed and depressed high school chemistry teacher who is struggling with midlife crisis and a recent diagnosis of stage-three lung cancer...','Vince Gilligan'),
('Game of Throne','Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, George R. R. Martins series of fantasy novels, the first of which is A Game of Thrones. The show was both produced and filmed in Belfast and elsewhere in the United Kingdom. Filming locations also included Canada, Croatia, Iceland, Malta, Morocco, and Spain.[4] The series premiered on HBO in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.','George R. R. Martin'),
('Rick and Morty','Rick and Morty is an American adult animated science fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Networks late-night programming block Adult Swim. The series follows the misadventures of cynical mad scientist Rick Sanchez and his good-hearted but fretful grandson Morty Smith, who split their time between domestic life and interdimensional adventures.','Justin Roiland')

update tv_series set description = 'Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, George R. R. Martin''s series of fantasy novels, the first of which is A Game of Thrones. The show was both produced and filmed in Belfast and elsewhere in the United Kingdom. Filming locations also included Canada, Croatia, Iceland, Malta, Morocco, and Spain.[4] The series premiered on HBO in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.'
	where title='Game of Throne';

update tv_series set description = 'Rick and Morty is an American adult animated science fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Network''s late-night programming block Adult Swim. The series follows the misadventures of cynical mad scientist Rick Sanchez and his good-hearted but fretful grandson Morty Smith, who split their time between domestic life and interdimensional adventures.'
	where title='Rick and Morty';
	
INSERT INTO tv_series(title,description, creator)
values 
('Stranger Things','Stranger Things es una serie web estadounidense de suspenso y ciencia ficción coproducida y distribuida por Netflix','Duffer Brothers'),
('Breaking Bad','Breaking Bad es una serie de televisión dramática estadounidense creada y producida por Vince Gilligan. Breaking Bad narra la historia de Walter White (Bryan Cranston), un profesor de química con problemas económicos a quien le diagnostican un cáncer de pulmón inoperable. Para pagar su tratamiento y asegurar el futuro económico de su familia comienza a cocinar y vender metanfetamina,1​ junto con Jesse Pinkman (Aaron Paul), un antiguo alumno suyo. La serie, ambientada y producida en Albuquerque (Nuevo México), se caracteriza por poner a sus personajes en situaciones que aparentemente no tienen salida, lo que llevó a que su creador la describa como un wéstern contemporáneo.','Vince Gilligan'),
('Game of Throne','Game of Thrones —llamada Juego de Tronos en España— es una serie de televisión de drama y fantasía medieval creada por David Benioff y D. B. Weiss y producida por la cadena HBO. Su argumento está inspirado en la serie de novelas Canción de hielo y fuego, escrita por el estadounidense George R. R. Martin, y relata las vivencias de un grupo de personajes de distintas casas nobiliarias en el continente ficticio de Poniente para tener el control del Trono de Hierro y gobernar los siete reinos que conforman el territorio','George R. R. Martin'),
('Rick and Morty','Rick y Morty es una serie de televisión estadounidense de animación para adultos creada por Justin Roiland y Dan Harmon para Adult Swim. La serie sigue las desventuras de un científico, Rick, y su fácilmente influenciable nieto, Morty, quienes pasan el tiempo entre la vida doméstica y los viajes espaciales, temporales e intergalácticos. Roiland es el encargado de darle voz a los dos personajes principales, la serie también incluye las voces de Chris Parnell, Spencer Grammer, y Sarah Chalke.','Justin Roiland')

INSERT INTO tv_series(title,description, creator)
values
('Vikings','Vikings es una serie de televisión de drama histórico creada y escrita por Michael Hirst para el canal History. Filmada en Irlanda, se estrenó el 3 de marzo de 2013 en Canadá. En enero de 2019, se anunció que la sexta temporada de 20 episodios, que se ordenó el 12 de septiembre de 2017, antes del estreno en la quinta temporada, sería la última temporada de la serie. La sexta temporada se estrenó el 4 de diciembre de 2019. Una serie secuela, titulada Vikings: Valhalla, está en desarrollo para Netflix.','Michael Hirst'),
('Vikings','Vikings is a historical drama television series created and written by Michael Hirst for the History channel. Filmed in Ireland, it premiered on March 3, 2013, in Canada. In January 2019, it was announced that the 20-episode sixth season, which was ordered on September 12, 2017, ahead of its fifth-season premiere, would be the final season of the series. The sixth season premiered on December 4, 2019. A sequel series, titled Vikings: Valhalla, is in development for Netflix.','Michael Hirst')

