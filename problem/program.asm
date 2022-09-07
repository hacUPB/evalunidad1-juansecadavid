// COLOCA AQUÍ TU NOMBRE COMPLETO Juan Sebastian Cadavid Carcamo
// COLOCA AQUÍ TU ID 000165481
// COLOCA AQUÍ TU CORREO ELECTRÓNICO juans.cadavid@upb.edu.co

(INICIO) 
                @KBD
                D=M
                @color //llamar a la variable
                M=1 //se pinta en negro
                @84
                D=D-A
                @SETREC //salto a realizar el rectangulo con estos parametros
                D;JEQ
                
                @KBD
                D=M
                @color
                M=0    //el color de pintura es blanco
                @67
                D=D-A 
                @SETCL
                D;JEQ

                @KBD
                D=M
                @88
                D=D-A
                @SETCL
                D;JEQ
                
 
                @INICIO
                0;JMP
(SETREC)
                @16400 //16384 + (128*32)
                D=A
                @coord //variable donde inicia el dibujo
                M=D 
                
                @256//candidad de registros a pintar
                D=A
                @cont //contador filas pantalla
                M=D
                
                @32
                D=A 
                @salto
                M=D
                @RECT
                0;JMP




(SETCL)
                @16384 //16384 + (128*32)
                D=A
                @coord //variable donde inicia el dibujo
                M=D 
                @8192 //candidad de registros a pintar
                D=A
                @cont //contador filas pantalla
                M=D
                @1
                D=A 
                @salto
                M=D
                @RECT3
                0;JMP
 



(RECT)
                @coord //16384 + (128*32)
                D=M
                @pscreen
                M=D //memoria donde inicia la pantalla

(PAINT)
                @cont //D=cont
                D=M 
 
                @SETHOR
                D;JEQ //if cont = 0 goto END
 
                //@256 Pixeles que se van a pintar bits
                //D=A


                @256
                D=A //cogio la variable de arriba
                
                @pscreen
                A=M 
                M=D //Pinto de negro el registro inicial
                
                @cont //cont = cont-1
                M=M-1
                
                @salto
                D=M
                
                @pscreen
                M=M+D //M+D
                
                @PAINT
                0;JMP

(SETHOR)
                @20480
                D=A
                @coord
                M=D

                @32
                D=A
                @cont
                M=D

                @salto
                M=1
                @RECT2
                0;JMP

(RECT2)
                @coord //16384 + (128*32)
                D=M
                @pscreen
                M=D //memoria donde inicia la pantalla

(PAINT2)
                @cont //D=cont
                D=M 
 
                @END
                D;JEQ //if cont = 0 goto END
 
                //@256 Pixeles que se van a pintar bits
                //D=A


                @color
                D=-1 //cogio la variable de arriba
                
                @pscreen
                A=M 
                M=D //Pinto de negro el registro inicial
                
                @cont //cont = cont-1
                M=M-1
                
                @salto
                D=M
                
                @pscreen
                M=M+D //M+D
                
                @PAINT2
                0;JMP

(RECT3)
                @coord //16384 + (128*32)
                D=M
                @pscreen
                M=D //memoria donde inicia la pantalla 

(PAINT3)
                @cont //D=cont
                D=M 
 
                @END
                D;JEQ //if cont = 0 go to END
 
                //@256 Pixeles que se van a pintar bits
                //D=A


                @color
                D=M //cogio la variable de arriba
                
                @pscreen
                A=M 
                M=D //Pinto de negro el registro inicial
                
                @cont //cont = cont-1
                M=M-1
                
                @salto
                D=M
                
                @pscreen
                M=M+D //M+D
                
                @PAINT3
                0;JMP
(END)
                @INICIO
                0;JMP
