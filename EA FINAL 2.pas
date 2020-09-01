program HALCONES;
uses crt;

type
        //Declaracion de lista//
        lista=^nodo;
        //Declaracion de registros//
        info=record
                nombre:string;
                apellido: string;
                edad: integer;
                telefono: string;
                domicilio: string;
                DNI:string;
                nac:string;
                Brigada:string;
                cuotas:integer;
                sabado:integer;
                mes:string;
                //"camp" es variable para saber si va al campamento y "cam" es para saber si pago//
                camp1:char;
                cam1:char;
                camp2:char;
                cam2:char;
                camp3:char;
                cam3:char;
                camp4:char;
                cam4:char;
                camp5:char;
                cam5:char;
                emp1:integer;
                emp2:integer;
                emp3:integer;
                emp4:integer;
                emp5:integer;
        end;
        nodo=record
                dato:info;
                psig:lista;
        end;
        info2=record
                lugar:string;
                fecha:string;
                precio:integer;
                observaciones:string;
        end;
        info3=record
                fecha:string;
                dochechas:string;
                precioxdoc:integer;
                ventatot:integer;
                ganancia:integer;
        end;
        info4=record
                nom:string;
                fecha:string;
                precio:integer;
                observacion:string;
                aux:integer;
        end;
        //Declaracion de vectores//
        vector=array[1..5] of info2;
        vector2=array[1..5] of info3;
        vector3=array[1..5] of info4;

        //Declaracion de archivo//
        archivo=file of info;
        archivo2=file of info2;
        archivo3=file of info3;
        archivo4=file of info4;



var
        l:lista; //LISTA DE PERSONAS//
        i:info;  //REGISTRO PARA PERSONAS//
        i2:info2; //REGISTRO DE CAMPAMENTOS//
        i3:info3; //REGISTRO DE EMPANADAZOS//
        i4:info4; //REGISTRO DE OTROS EVENTOS//
        arc:archivo; //ARCHIVO DE PERSONAS//
        arc2:archivo2;
        arc3:archivo3;
        arc4:archivo4;
        rta:string;
        v:vector;     //VECTOR PARA CAMPAMENTOS//
        v2:vector2;   //VECTOR PARA EMPANADAZOS//
        v3:vector3;   //VECTOR PARA OTROS EVENTOS//
        j,r:integer;
        act:lista;




//.............................................BUSQUEDA ...............................................//
//..............................................................................................//

//..........busqueda para eliminar una persona...............//
//Busca el dato y elimina la posicion de memoria en la lista//
procedure busquedafinal2(l:lista; ap:string; var actual:lista; var ant:lista; var r:integer);
var
        sig:lista;
begin
clrscr;
if (l=nil) then
begin
        writeln('Lista vacia');
        readkey;
end
else
begin
        sig:=actual^.psig;
        ant:=nil;
        while (actual^.dato.apellido<>ap) and (sig<>nil) do
        begin
                        ant:=actual;
                        actual:=actual^.psig;
                        sig:=actual^.psig;
        end;
        if (actual^.dato.apellido<>ap) then
        begin
                writeln('Elemento no encontrado');
                r:=0;
                readkey;
        end
        else
        begin
                clrscr;
                writeln;
                writeln;
                writeln('Nombre: ',actual^.dato.nombre);
                writeln('Apellido: ',actual^.dato.apellido);
                writeln('Edad: ',actual^.dato.edad);
                writeln('Domicilio: ',actual^.dato.domicilio);
                writeln('Brigada: ',actual^.dato.brigada);
                writeln('Telefono: ',actual^.dato.telefono);
                writeln('DNI: ',actual^.dato.dni);
                writeln('Fecha de nacimiento: ',actual^.dato.nac);
                writeln;
                writeln;
                writeln('Es esta la persona buscada?s/n)');
                readln(rta);
                if (rta<>'s') then
                begin
                        if (actual^.psig=nil) then
                        begin
                        writeln('Elemento No encontrado');
                        r:=0;
                        readkey;
                        end
                        else
                        begin
                        actual:=actual^.psig;
                        busquedafinal2(l,ap,ant,actual,r);
                        end;
                end
                else
                r:=1;

         end;
end;
end;




//........................otras busquedas..................................//
//la explicacion esta en el siguiente procedimiento

procedure busquedafinal(l:lista; ap:string; var actual:lista; var r:integer);
var
        sig:lista;
begin
sig:=l;
while (actual^.dato.apellido<>ap) and (sig<>nil) do
        begin
                        actual:=actual^.psig;
                        sig:=actual^.psig;
        end;
        if (actual^.dato.apellido<>ap) then
        begin
                writeln('Elemento no encontrado');
                r:=0;
                readkey;
        end
        else
        begin
                clrscr;
                writeln;
                writeln;
                writeln('Nombre: ',actual^.dato.nombre);
                writeln('Apellido: ',actual^.dato.apellido);
                writeln('Edad: ',actual^.dato.edad);
                writeln('Domicilio: ',actual^.dato.domicilio);
                writeln('Brigada: ',actual^.dato.brigada);
                writeln('Telefono: ',actual^.dato.telefono);
                writeln('DNI: ',actual^.dato.dni);
                writeln('Fecha de nacimiento: ',actual^.dato.nac);
                writeln('Mes de inicio: ',actual^.dato.mes);
                writeln;
                writeln;
                writeln('Es esta la persona buscada?(s/n)');
                readln(rta);
                if (rta<>'s') then
                begin
                        if (actual^.psig=nil) then
                        begin
                        writeln('Elemento No encontrado');
                        r:=0;
                        readkey;
                        end
                        else
                        begin
                        actual:=actual^.psig;
                        busquedafinal(l,ap,actual,r);
                        end;
                end;
                r:=1;

         end;
end;





//......................modulo principal de busquda.....................//
//USA RECURSION//
//Pide ingresar un apellido;
//Si encuentra un apellido que coincida, lo muestra.
//Si no es el deseado, se pasa al siguiente, hasta llegar al final de la lista//

procedure busquedadato(l:lista; var actual:lista; var r:integer);
var
        ap:string;

begin
        clrscr;
        if (l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        writeln('Ingrese apellido (en minuscula)');
        readln(ap);
        actual:=l;
        busquedafinal(l,ap,actual,r);
end;
end;



//................................................FIN BUSQUEDA......................................//


//..................................................................
//...............................AGREGAR............................//
//..................................................................


//Ordena segun la edad. En la lista apareceran primero los mas chicos
procedure AG_ORD (var l:lista; i:info);
var
        nuevo,actual,anterior:lista;
begin
        new(nuevo);
        nuevo^.dato.nombre:=i.nombre;
        nuevo^.dato.apellido:=i.apellido;
        nuevo^.dato.telefono:=i.telefono;
        nuevo^.dato.edad:=i.edad;
        nuevo^.dato.dni:=i.dni;
        nuevo^.dato.nac:=i.nac;
        nuevo^.dato.domicilio:=i.domicilio;
        nuevo^.dato.brigada:=i.brigada;
        nuevo^.dato.cuotas:=i.cuotas;
        nuevo^.dato.sabado:=i.sabado;
        nuevo^.dato.mes:=i.mes;
        nuevo^.dato.camp1:=i.camp1;
        nuevo^.dato.camp2:=i.camp2;
        nuevo^.dato.camp3:=i.camp3;
        nuevo^.dato.camp4:=i.camp4;
        nuevo^.dato.camp5:=i.camp5;
        nuevo^.dato.cam1:=i.cam1;
        nuevo^.dato.cam2:=i.cam2;
        nuevo^.dato.cam3:=i.cam3;
        nuevo^.dato.cam4:=i.cam4;
        nuevo^.dato.cam5:=i.cam5;
        nuevo^.dato.emp1:=i.emp1;
        nuevo^.dato.emp2:=i.emp2;
        nuevo^.dato.emp3:=i.emp3;
        nuevo^.dato.emp4:=i.emp4;
        nuevo^.dato.emp5:=i.emp5;
        actual:=l;
        anterior:=nil;
        while(actual<>nil) and (actual^.dato.edad<i.edad) do
        begin
                anterior:=actual;
                actual:=actual^.psig;
        end;
        if (anterior=nil) then
        begin
                nuevo^.psig:=l;
                l:=nuevo;
        end
        else
        begin
                nuevo^.psig:=actual;
                anterior^.psig:=nuevo;
        end;
end;





//Pide los datos y lo ingresa ordenado por el procedimiento anterior

procedure INGRESOPERSONAS (var l:lista);
var
        rta:char;
begin
        rta:='s';
        while(rta='s') do
        begin
                clrscr;
                writeln('Ingrese nombre (en minuscula)');
                readln(i.nombre);
                writeln('Ingrese apellido (en minuscula)');
                readln(i.apellido);
                writeln('Ingrese telefono');
                readln(i.telefono);
                writeln('Ingrese edad');
                readln(i.edad);
                writeln('Ingrese domicilio');
                readln(i.domicilio);
                writeln('Ingrese DNI');
                readln(i.dni);
                writeln('Ingrese fecha de nacimiento');
                readln(i.nac);
                i.cuotas:=0;
                i.sabado:=0;
                writeln('Ingrese mes de ingreso');
                readln(i.mes);
                if (i.edad < 10) then
                        i.brigada:='Leniadores'
                else
                        if(i.edad<13) then
                                i.brigada:='Pioneros'
                        else
                                if(i.edad<15) then
                                        i.brigada:='Conquistadores'
                                else
                                        if(i.edad<19) then
                                                i.brigada:='Halcones'
                                        else
                                                if (i.edad>18) then
                                                        i.brigada:='Capitanes';


                ag_ord(l,i);
                writeln;
                writeln('INGRESADO');
                writeln;
                writeln('Desea ingresar otra persona?');
                readln(rta);
        end;
end;






//.........................................IMPRIMIR.................................................
//.................................................................................................


//Imprime todas las personas de la lista, mostrando los datos

procedure IMPRIMIRLISTAPERSONAS(l:lista);
begin
        clrscr;
        if (l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        writeln('Imprimiendo lista...');
        j:=0;
        while(l<>nil) do
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln('Mes de ingreso: ',l^.dato.mes);
        writeln;
        writeln('------------------------------------');
        j:=j+1;
        l:=l^.psig;
        end;
        writeln;
        writeln('Cantidad total de personas: ',j);
        end;
        readkey;
end;







//imprime todas las personas de la lista,  con el dato del pago de cuotas

procedure imprimirlistapagos (l:lista);
begin
        clrscr;
        writeln('LISTA DE CUOTAS');
        if (l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        while(l<>nil) do
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Cuotas pagadas en este anio: ',l^.dato.cuotas,' desde el mes de ',l^.dato.mes);
        writeln;
        writeln('------------------------------------');
        l:=l^.psig;
        end;
        end;
        readkey;
end;




//Imprime todas las personas mostrando su asistencia en el anio
//Avisa de aquellos que ya pueden recibir el uniforme



procedure imprimirlistaasistencia (l:lista);
begin
        clrscr;
        writeln('LISTA DE ASISTENCIA');
        writeln;
        writeln('Cuando el mes dice "enero1" significa que ya viene desde el anio anterior');
        writeln;
        writeln('Se avisara de aquellos que ya pueden recibir el uniforme');
        writeln;
        readkey;
        if (l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        while(l<>nil) do
        begin
        writeln('Nombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Sabados asistidos: ',l^.dato.sabado,' desde el mes de ',l^.dato.mes);
        if (l^.dato.sabado>=8) and (l^.dato.mes<>'enero1') then
                writeln('Puede recibir el uniforme');
        writeln;
        writeln('------------------------------------');
        writeln;
        l:=l^.psig;
        end;
        readkey;
        end;
end;



//Imprime todas las personas segun el grupo donde se encuentren

procedure imprimirporbrigada (l:lista);
var
actual:lista;
begin

        actual:=l;
        clrscr;
        if(l=nil) then
        begin
                writeln('Lista vacia');
                writeln;
        end
        else
        begin
        writeln('LISTA GENERAL POR BRIGADAS');
        writeln;
        writeln;
        writeln('-------------------------');
        writeln('LISTA DE LENIADORES');
        writeln;
        while(l<>nil) do
        begin
        if (l^.dato.brigada='Leniadores') then
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln;
        writeln('------------------------------------');
        end;
        l:=l^.psig;
        end;
        l:=actual;
        readkey;
        writeln;
        writeln;
        writeln;
        writeln('----------------------');
        writeln('LISTA DE PIONEROS');
        writeln;
        while(l<>nil) do
        begin
        if (l^.dato.brigada='Pioneros') then
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln;
        writeln('------------------------------------');
        end;
        l:=l^.psig;
        end;
        l:=actual;
        readkey;
        writeln;
        writeln;
        writeln;
        writeln('------------------------');
        writeln('LISTA DE CONQUISTADORES');
        writeln;
        while(l<>nil) do
        begin
        if (l^.dato.brigada='Conquistadores') then
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln;
        writeln('------------------------------------');
        end;
        l:=l^.psig;
        end;
        l:=actual;
        readkey;
        writeln;
        writeln;
        writeln;
        writeln('-------------------');
        writeln('LISTA DE HALCONES');
        while(l<>nil) do
        begin
        if (l^.dato.brigada='Halcones') then
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln;
        writeln('------------------------------------');
        end;
        l:=l^.psig;
        end;
        l:=actual;
        readkey;
        writeln;
        writeln;
        writeln;
        writeln('-------------------');
        writeln('LISTA DE CAPITANES');
        writeln;
        while(l<>nil) do
        begin
        if (l^.dato.brigada='Capitanes') then
        begin
        writeln('Mombre: ',l^.dato.nombre);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Edad: ',l^.dato.edad);
        writeln('Telefono: ',l^.dato.telefono);
        writeln('Domicilio: ',l^.dato.domicilio);
        writeln('Brigada: ',l^.dato.brigada);
        writeln('DNI: ',l^.dato.dni);
        writeln('Fecha de nacimiento: ',l^.dato.nac);
        writeln;
        writeln('------------------------------------');
        end;
        l:=l^.psig;
        end;
        readkey;
        end;
end;



//Imprime los campamentos y sus datos

procedure imprimircampamento (v:vector);
begin
        clrscr;
        writeln('LISTA DE CAMPAMENTOS');
        for j:= 1 to 5 do
        begin
                writeln(j);
                writeln('Lugar: ',v[j].lugar);
                writeln('Fecha: ',v[j].fecha);
                writeln('Precio: ',v[j].precio);
                writeln('Observaciones: ',v[j].observaciones);
                writeln;
                writeln('--------------------------');
        end;
end;




//Imprime todas las personas de una brigada seleccionada

procedure imprimirporbrigada2(l:lista);
var
t:integer;
begin
        t:=0;
        clrscr;
        writeln('LISTA DE BRIGADAS');
        writeln;
        writeln('1. Leniadores');
        writeln;
        writeln('2. Pioneros');
        writeln;
        writeln('3. Conquistadores');
        writeln;
        writeln('4. Halcones');
        writeln;
        writeln('5. Capitanes');
        writeln;
        writeln('Ingrese opcion en numero');
        readln(rta);
        case rta of
                '1':begin
                if (l=nil) then
                begin
                writeln('Lista vacia');
                readkey;
                end
                else
                begin
                while (l<>nil) do
                begin
                        if(l^.dato.brigada='Leniadores') then
                        begin
                        writeln('Mombre: ',l^.dato.nombre);
                        writeln('Apellido: ',l^.dato.apellido);
                        writeln('Edad: ',l^.dato.edad);
                        writeln('Telefono: ',l^.dato.telefono);
                        writeln('Domicilio: ',l^.dato.domicilio);
                        writeln('Brigada: ',l^.dato.brigada);
                        writeln('DNI: ',l^.dato.dni);
                        writeln('Fecha de nacimiento: ',l^.dato.nac);
                        writeln;
                        writeln('------------------------------------');
                        t:=t+1;
                        end;
                        l:=l^.psig;
                end;
                writeln('Cantidad total: ',t);
                readkey;
                end;
                end;
                '2':begin
                if (l=nil) then
                begin
                writeln('Lista vacia');
                readkey;
                end
                else
                begin
                while (l<>nil) do
                begin
                        if(l^.dato.brigada='Pioneros') then
                        begin
                        writeln('Mombre: ',l^.dato.nombre);
                        writeln('Apellido: ',l^.dato.apellido);
                        writeln('Edad: ',l^.dato.edad);
                        writeln('Telefono: ',l^.dato.telefono);
                        writeln('Domicilio: ',l^.dato.domicilio);
                        writeln('Brigada: ',l^.dato.brigada);
                        writeln('DNI: ',l^.dato.dni);
                        writeln('Fecha de nacimiento: ',l^.dato.nac);
                        writeln;
                        writeln('------------------------------------');
                        t:=t+1;
                        end;
                        l:=l^.psig;
                end;
                writeln('Cantidad total: ',t);
                readkey;
                end;
                end;
                '3':begin
                if (l=nil) then
                begin
                writeln('Lista vacia');
                readkey;
                end
                else
                begin
                while (l<>nil) do
                begin
                        if(l^.dato.brigada='Conquistadores') then
                        begin
                        writeln('Mombre: ',l^.dato.nombre);
                        writeln('Apellido: ',l^.dato.apellido);
                        writeln('Edad: ',l^.dato.edad);
                        writeln('Telefono: ',l^.dato.telefono);
                        writeln('Domicilio: ',l^.dato.domicilio);
                        writeln('Brigada: ',l^.dato.brigada);
                        writeln('DNI: ',l^.dato.dni);
                        writeln('Fecha de nacimiento: ',l^.dato.nac);
                        writeln;
                        writeln('------------------------------------');
                        t:=t+1;
                        end;
                        l:=l^.psig;
                end;
                writeln('Cantidad total: ',t);
                readkey;
                end;
                end;
                '4':begin
                if (l=nil) then
                begin
                writeln('Lista vacia');
                readkey;
                end
                else
                begin
                while (l<>nil) do
                begin
                        if(l^.dato.brigada='Halcones') then
                        begin
                        writeln('Mombre: ',l^.dato.nombre);
                        writeln('Apellido: ',l^.dato.apellido);
                        writeln('Edad: ',l^.dato.edad);
                        writeln('Telefono: ',l^.dato.telefono);
                        writeln('Domicilio: ',l^.dato.domicilio);
                        writeln('Brigada: ',l^.dato.brigada);
                        writeln('DNI: ',l^.dato.dni);
                        writeln('Fecha de nacimiento: ',l^.dato.nac);
                        writeln;
                        writeln('------------------------------------');
                        t:=t+1;
                        end;
                        l:=l^.psig;
                end;
                writeln('Cantidad total: ',t);
                readkey;
                end;
                end;
                '5':begin
                if (l=nil) then
                begin
                writeln('Lista vacia');
                readkey;
                end
                else
                begin
                while (l<>nil) do
                begin
                        if(l^.dato.brigada='Capitanes') then
                        begin
                        writeln('Mombre: ',l^.dato.nombre);
                        writeln('Apellido: ',l^.dato.apellido);
                        writeln('Edad: ',l^.dato.edad);
                        writeln('Telefono: ',l^.dato.telefono);
                        writeln('Domicilio: ',l^.dato.domicilio);
                        writeln('Brigada: ',l^.dato.brigada);
                        writeln('DNI: ',l^.dato.dni);
                        writeln('Fecha de nacimiento: ',l^.dato.nac);
                        writeln;
                        writeln('------------------------------------');
                        t:=t+1;
                        end;
                        l:=l^.psig;
                end;
                writeln('Cantidad total: ',t);
                readkey;
                end;
                end;

end;
end;







//Imprime los empanadazos y sus datos


procedure imprimirempanadazos(v2:vector2);
begin
        clrscr;
        writeln('LISTA DE EMPANADAZOS');
        for j:=1 to 5 do
        begin
                writeln(j);
                writeln('Fecha: ',v2[j].fecha);
                writeln('Docenas hechas: ',v2[j].dochechas);
                writeln('Precio por docena: ',v2[j].precioxdoc);
                writeln('Venta total: ',v2[j].ventatot);
                writeln('Ganancia: ',v2[j].ganancia);
                writeln;
                writeln('--------------------------');
        end;
end;





//Imprime participantes del campamento seleccionado


procedure imprimirparticipantes (v:vector; l:lista);
var
actual:lista;
q,t:integer;
begin
        imprimircampamento (v);
        actual:=l;
        writeln('Ingrese campamento a chequear');
        readln(t);
        if (t>5) or (t<1) then
        begin
                writeln;
                writeln('Opcion incorrecta');
                readkey;
        end
        else
        if (v[t].precio=0) then
        begin
                writeln;
                writeln('Campamento no existente');
                readkey;
        end
        else
        begin
        q:=0;
        clrscr;
        writeln('Aquellos que pagaron, se indicara seguido del nombre con una "s" en caso afirmativo');
        writeln;
        case t of
        1:begin
        writeln('LISTA DE PARTICIPANTES DEL CAMPAMENTO 1');
        while (actual<>nil) do
        begin
                if (actual^.dato.camp1='s') then
                begin
                writeln;
                write(actual^.dato.nombre,' ');
                writeln(actual^.dato.apellido);
                if (actual^.dato.cam1='s') then
                writeln(actual^.dato.cam1);
                q:=q+1;
                end;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Total de personas: ',q);
        readkey;
        end;
        2:begin
        writeln('LISTA DE PARTICIPANTES DEL CAMPAMENTO 2');
        while (actual<>nil) do
        begin
                if (actual^.dato.camp2='s') then
                begin
                writeln;
                writeln(actual^.dato.nombre,' ');
                writeln(actual^.dato.apellido);
                if (actual^.dato.cam2='s') then
                writeln(actual^.dato.cam2);
                q:=q+1;
                end;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Total de personas: ',q);
        readkey;
        end;
        3:begin
        writeln('LISTA DE PARTICIPANTES DEL CAMPAMENTO 3');
        while (actual<>nil) do
        begin
                if (actual^.dato.camp3='s') then
                begin
                writeln;
                writeln(actual^.dato.nombre,' ');
                writeln(actual^.dato.apellido);
                if (actual^.dato.cam3='s') then
                writeln(actual^.dato.cam3);
                q:=q+1;
                end;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Total de personas: ',q);
        readkey;
        end;
        4:begin
        writeln('LISTA DE PARTICIPANTES DEL CAMPAMENTO 4');
        while (actual<>nil) do
        begin
                if (actual^.dato.camp4='s') then
                begin
                writeln;
                writeln(actual^.dato.nombre,' ');
                writeln(actual^.dato.apellido);
                if (actual^.dato.cam4='s') then
                writeln(actual^.dato.cam4);
                q:=q+1;
                end;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Total de personas: ',q);
        readkey;
        end;
        5:begin
        writeln('LISTA DE PARTICIPANTES DEL CAMPAMENTO 5');
        while (actual<>nil) do
        begin
                if (actual^.dato.camp5='s') then
                begin
                writeln;
                writeln(actual^.dato.nombre,' ');
                writeln(actual^.dato.apellido);
                if (actual^.dato.cam4='s') then
                writeln(actual^.dato.cam5);
                q:=q+1;
                end;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Total de personas: ',q);
        readkey;
        end;
        end;
end;
end;





 //Imprime las ventas de todas las personas por empanadazo seleccionado

procedure imprimirventas (var v2:vector2; l:lista);
var
        actual:lista;
        t:integer;
begin
        imprimirempanadazos(v2);
        writeln('Ingrese empanadazo a chequear');
        readln(t);
        if (t<1) or (t>5) then
        begin
                writeln;
                writeln('Opcion incorrecta');
                readkey;
        end
        else
        if(v2[t].precioxdoc=0) then
        begin
                writeln;
                writeln('Empanadazo no existente');
                readkey;
        end
        else
        begin
        clrscr;
        actual:=l;
        case t of
        1:begin
                writeln;
                v2[1].ventatot:=0;
                while (actual<>nil) do
                begin
                writeln;
                write(actual^.dato.nombre);
                writeln(' ',actual^.dato.apellido);
                writeln('Vendio: ',actual^.dato.emp1);
                if (actual^.dato.emp1>=15) and (actual^.dato.emp1<30) then
                        writeln('Aplicar 5% de descuento al proximo campamento')
                else
                begin
                        if (actual^.dato.emp1>=30 )then
                         writeln('Aplicar 10% de descuento al proximo campamento')
                end;
                v2[1].ventatot:=v2[1].ventatot+actual^.dato.emp1;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Venta total: ',v2[1].ventatot);
        readkey;
        writeln;
        v2[1].ganancia:=v2[1].ventatot*v2[1].precioxdoc;
        writeln('Gananacia total: ',v2[1].ganancia);
        writeln;
        readkey;

        end;
        2:begin
                writeln;
                v2[2].ventatot:=0;
                while (actual<>nil) do
                begin
                writeln;
                write(actual^.dato.nombre);
                writeln(' ',actual^.dato.apellido);
                writeln('Vendio: ',actual^.dato.emp2);
                if (actual^.dato.emp2>=15) and (actual^.dato.emp2<30) then
                        writeln('Aplicar 5% de descuento al proximo campamento')
                else
                begin
                        if (actual^.dato.emp2>=30 )then
                         writeln('Aplicar 10% de descuento al proximo campamento')
                end;
                v2[2].ventatot:=v2[2].ventatot+actual^.dato.emp2;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Venta total: ',v2[2].ventatot);
        readkey;
        writeln;
        v2[2].ganancia:=v2[2].ventatot*v2[2].precioxdoc;
        writeln('Gananacia total: ',v2[2].ganancia);
        writeln;
        readkey;

        end;
        3:begin
                writeln;
                v2[3].ventatot:=0;
                while (actual<>nil) do
                begin
                writeln;
                write(actual^.dato.nombre);
                writeln(' ',actual^.dato.apellido);
                writeln('Vendio: ',actual^.dato.emp3);
                if (actual^.dato.emp3>=15) and (actual^.dato.emp3<30) then
                        writeln('Aplicar 5% de descuento al proximo campamento')
                else
                begin
                        if (actual^.dato.emp3>=30 )then
                         writeln('Aplicar 10% de descuento al proximo campamento')
                end;
                v2[3].ventatot:=v2[3].ventatot+actual^.dato.emp3;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Venta total: ',v2[3].ventatot);
        readkey;
        writeln;
        v2[3].ganancia:=v2[3].ventatot*v2[3].precioxdoc;
        writeln('Gananacia total: ',v2[3].ganancia);
        writeln;
        readkey;
        end;
        4:begin
                writeln;
                v2[4].ventatot:=0;
                while (actual<>nil) do
                begin
                writeln;
                write(actual^.dato.nombre);
                writeln(' ',actual^.dato.apellido);
                writeln('Vendio: ',actual^.dato.emp4);
                if (actual^.dato.emp4>=15) and (actual^.dato.emp4<30) then
                        writeln('Aplicar 5% de descuento al proximo campamento')
                else
                begin
                        if (actual^.dato.emp4>=30 )then
                         writeln('Aplicar 10% de descuento al proximo campamento')
                end;
                v2[4].ventatot:=v2[4].ventatot+actual^.dato.emp4;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Venta total: ',v2[4].ventatot);
        readkey;
        writeln;
        v2[4].ganancia:=v2[4].ventatot*v2[4].precioxdoc;
        writeln('Gananacia total: ',v2[4].ganancia);
        writeln;
        readkey;

        end;
        5:begin
                writeln;
                v2[5].ventatot:=0;
                while (actual<>nil) do
                begin
                writeln;
                write(actual^.dato.nombre);
                writeln(' ',actual^.dato.apellido);
                writeln('Vendio: ',actual^.dato.emp5);
                if (actual^.dato.emp5>=15) and (actual^.dato.emp5<30) then
                        writeln('Aplicar 5% de descuento al proximo campamento')
                else
                begin
                        if (actual^.dato.emp5>=30 )then
                         writeln('Aplicar 10% de descuento al proximo campamento')
                end;
                v2[5].ventatot:=v2[5].ventatot+actual^.dato.emp5;
                actual:=actual^.psig;
        end;
        writeln;
        writeln('Venta total: ',v2[5].ventatot);
        readkey;
        writeln;
        v2[5].ganancia:=v2[5].ventatot*v2[5].precioxdoc;
        writeln('Gananacia total: ',v2[5].ganancia);
        writeln;
        readkey;
        end;
        end;
        end;
end;





//Imprime eventos, mostrando sus datos


procedure imprimireventos (v3:vector3);
begin
        clrscr;
        writeln('LISTA DE EVENTOS');
        writeln;
        writeln;
        for j:=1 to 5 do
        begin
                writeln;
                writeln(j);
                writeln('Nombre: ',v3[j].nom);
                writeln('Fecha: ',v3[j].fecha);
                writeln('Precio: ',v3[j].precio);
                writeln('Observaciones: ',v3[j].observacion);
                writeln;
                writeln('---------------------------------');
        end;
end;








//...............................................FIN IMPRIMIR............................................

//..............................................................................................
//..............................................................................................

//.............................................AGREGAR DATOS2.......................................

//Agrega un campamento en el anio
procedure agregarcampamentos (var v:vector);
begin
        if (v[5].precio<>0) then
        begin
                writeln('Lista llena');
                readkey;
        end
        else
        begin
        writeln('Ingrese lugar del campamento');
        readln(i2.lugar);
        writeln('Ingrese fecha de inicio y termino');
        readln(i2.fecha);
        writeln('Ingrese precio//CAMPO OBLIGATORIO');
        readln(i2.precio);
        writeln('Ingrese alguna observacion si quisiese');
        readln(i2.observaciones);
        j:=1;
        while (v[j].precio<>0) do
        j:=j+1;
        v[j]:=i2;
        writeln('AGREGADO');
        readkey;
        end;

end;



//Agrega un empanadazo en el anio
procedure agregarempanadazo (var v2:vector2);
begin
        if (v2[5].precioxdoc<>0) then
        begin
                writeln('Lista llena');
                readkey;
        end
        else
        begin
        writeln('Ingrese fecha');
        readln(i3.fecha);
        writeln('Ingrese cantidad de docenas a preparar');
        readln(i3.dochechas);
        writeln('Ingrese precio por docena//CAMPO OBLIGATORIO');
        readln(i3.precioxdoc);
        i3.ventatot:=0;
        i3.ganancia:=0;
        j:=1;
        while (v2[j].precioxdoc<>0) do
        begin
        j:=j+1;
        end;
        v2[j]:=i3;
        writeln;
        writeln('AGREGADO');
        readkey;
        end;
end;






//Ingresa el pago de una cuota

procedure agregarpagocuotas (var l:lista);
var
        actual,sig:lista;

begin
        clrscr;
        if (l=nil) then
        begin
                writeln;
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        rta:='s';
        while (rta='s') do
        begin
        actual:=l;
        busquedadato(l,actual,r);
        if (r=1) then
        begin
                actual^.dato.cuotas:=actual^.dato.cuotas+1;
                writeln('pago ',actual^.dato.cuotas,' este anio desde ',actual^.dato.mes);
        end;
        writeln;
        writeln('actualizar otra persona?s/n');
        readln(rta);
        end;
        end;
end;






//ingresa una asistencia//



procedure agregarasistencia (var l:lista);
var
        actual,sig:lista;
        nom,ap:string;

begin
        clrscr;
        if (l = nil) then
        begin
                writeln;
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        rta:='s';
        while (rta='s') do
        begin
        actual:=l;
        busquedadato(l,actual,r);
        if (r=1) then
        begin
                actual^.dato.sabado:=actual^.dato.sabado+1;
                writeln('asistio ',actual^.dato.sabado,' veces este anio desde ',actual^.dato.mes);
        end;
        writeln;
        writeln('actualizar otra persona?s/n');
        readln(rta);
        end;
        end;
end;





//Ingresa participante en un campamento seleccionado

procedure ingresarparticipante(v:vector; var l:lista);
var
        nom,ap,rta2:string;
        q:integer;
        actual,sig:lista;
begin
        clrscr;
        imprimircampamento(v);
        writeln;
        writeln('Ingrese campamento a actualizar');
        readln(q);
        if ((q<1) or (q>5)) then
        begin
                writeln;
                writeln('Opcion incorrecta');
                writeln;
                readkey;
        end
        else
        begin
        if (v[q].precio=0) then
        begin
                writeln;
                writeln('Campamento no existente');
                writeln;
                readkey;
        end
        else
        rta2:='s';
        while (rta2='s') do
        begin
                clrscr;
                actual:=l;
                busquedadato(l,actual,r);
                if (r=1) then
                begin
                case q of
                1:actual^.dato.camp1:='s';
                2:actual^.dato.camp2:='s';
                3:actual^.dato.camp3:='s';
                4:actual^.dato.camp4:='s';
                5:actual^.dato.camp5:='s';
                end;
                writeln;
                writeln('INGRESADO');
                writeln;
        end;
        writeln('Desea ingresar otro participante? (se ingresara en el mismo campamento) s/n');
        readln(rta2);
        end;
        end;
end;



//Ingresa el pago de una persona de un campamento selecionado

procedure ingresarpago(v:vector; var l:lista);
var
        rta2:string;
        actual,sig:lista;
        q:integer;
begin

        imprimircampamento(v);
        writeln('Ingrese campamento a actualizar');
        readln(q);
        rta2:='s';
        if((q<1) or (q>5)) then
        begin
                writeln;
                writeln('Opcion incorrecta');
                readkey;
        end
        else
        if(v[q].precio=0) then
        begin
                writeln;
                writeln('Campamento no existente');
                writeln;
                readkey;
        end
        else
        begin
        while (rta2='s') do
        begin
        busquedadato(l,actual,r);
        if (r=1) then
        begin
                case q of
                1:actual^.dato.cam1:='s';
                2:actual^.dato.cam2:='s';
                3:actual^.dato.cam3:='s';
                4:actual^.dato.cam4:='s';
                5:actual^.dato.cam5:='s';
                end;
                writeln;
                writeln('PAGO INGRESADO');
                writeln;
        end;
        writeln('Desea ingresar otro pago?s/n');
        readln(rta2);
        end;
        end;
end;








//Ingresa la cantidad de ventas de una persona en un empanadazo seleccionado


procedure actualizarventas (var l:lista);
var
        actual,sig:lista;
        k:integer;
        j:integer;
begin
        rta:='s';
        while(rta='s') do
        begin
        busquedadato (l, actual,r);
        if (r=1) then
        begin
        clrscr;
        imprimirempanadazos(v2);
        writeln;
        writeln('Ingrese numero de empanadazo');
        readln(j);
        if ((j>0) and (j<6)) then
        begin
        writeln;
        writeln('Ingrese cantidad de docenas totales vendidas');
        readln(k);
        case (j) of
                1:actual^.dato.emp1:=k;
                2:actual^.dato.emp2:=k;
                3:actual^.dato.emp3:=k;
                4:actual^.dato.emp4:=k;
                5:actual^.dato.emp5:=k;
        end;
        writeln;
        writeln('ACTUALIZADO');
        writeln;
        end
        else
        begin
                writeln;
                writeln('Opcion incorrecta');
                readkey;
        end;
        end;
        writeln('Desea ingresar mas ventas?s/n');
        readln(rta);
        end;
end;




//simula un cambio de anio
//se reinician todos los eventos
//los datos anuales, tales como pagos, asistencia, son reiniciados


procedure cambiaranio (var l:lista; var v:vector; var v2:vector2);
var
        j:integer;
        actual:lista;
begin
        writeln('ADVERTENCIA');
        writeln;
        writeln('Al actualizar el anio, se perderan todos los datos de empanadazos y campamentos');
        writeln;
        writeln('Tambien se reiniciaran los contadores de pagos anuales y de asistencia anual. El mes de ingreso de todos las personas sera "enero1"');
        writeln;
        writeln('Al salir y entrar del programa se actualizaran todos los datos');
        writeln;
        readkey;
        writeln('Desea continuar?s/n');
        readln(rta);
        if (rta='s') then
        begin
                for j:= 1 to 5 do
                begin
                v[j].lugar:='';
                v[j].fecha:='';
                v[j].precio:=0;
                v[j].observaciones:='';
                v2[j].fecha:='';
                v2[j].dochechas:='0';
                v2[j].precioxdoc:=0;
                v2[j].ventatot:=0;
                v2[j].ganancia:=0;
                end;
                actual:=l;
                while (actual<>nil) do
                begin
                        actual^.dato.edad:=actual^.dato.edad+1;
                        if (actual^.dato.edad < 10) then
                        actual^.dato.brigada:='Leniadores'
                        else
                        if(actual^.dato.edad<13) then
                                actual^.dato.brigada:='Pioneros'
                        else
                                if(actual^.dato.edad<15) then
                                        actual^.dato.brigada:='Conquistadores'
                                else
                                        if(actual^.dato.edad<19) then
                                                actual^.dato.brigada:='Halcones'
                                        else
                                                if (actual^.dato.edad>18) then
                                                        actual^.dato.brigada:='Capitanes';
                        actual^.dato.cuotas:=0;
                        actual^.dato.sabado:=0;
                        actual^.dato.mes:='Enero1';
                        actual^.dato.camp1:='n';
                        actual^.dato.camp2:='n';
                        actual^.dato.camp3:='n';
                        actual^.dato.camp4:='n';
                        actual^.dato.camp5:='n';
                        actual^.dato.cam1:='n';
                        actual^.dato.cam2:='n';
                        actual^.dato.cam3:='n';
                        actual^.dato.cam4:='n';
                        actual^.dato.cam5:='n';
                        actual^.dato.emp1:=0;
                        actual^.dato.emp2:=0;
                        actual^.dato.emp3:=0;
                        actual^.dato.emp4:=0;
                        actual^.dato.emp5:=0;
                        actual:=actual^.psig;
                end;
        end;
        writeln;
        writeln('LISTA ACTUALIZADA');
        writeln;
        readkey;
end;





//agrega un evento que no es empanadazo ni campamento


procedure agregarevento (var v3:vector3);
begin
        if (v3[5].aux<>0) then
        begin
                writeln('Lista llena');
                readkey;
        end
        else
        begin
        writeln('Ingrese nombre del evento');
        readln(i4.nom);
        writeln('Ingrese fecha');
        readln(i4.fecha);
        writeln('Ingrese precio');
        readln(i4.precio);
        writeln('Ingrese alguna observacion si lo desea');
        readln(i4.observacion);
        i4.aux:=1;
        writeln;
        j:=1;
        while (v3[j].aux<>0) do
        j:=j+1;
        v3[j]:=i4;
        writeln;
        writeln('Evento ingresado');
        readkey;
        end;
end;



//.............................................MODIFICAR..............................................
//................................................................................................
//................................................................................................



//ordena los empanadazos por mayor cantidad de ventas
procedure ordenamiento (v2:vector2);
var
	i,j,cont:integer;
	aux:info3;
	sigue:boolean;
begin
        cont:=5;
        i:=1;
	sigue:=true;
	//ORDENADO POR MAYOR CANTIDAD DE VENTAS//
	while (i<cont) and (sigue=true) do
	begin
		sigue:=false;
		for j:=1 to cont-1 do
		begin
			if(V2[j].ventatot<v2[j+1].ventatot) then
			begin
				aux:=v2[j];
				v2[j]:=v2[j+1];
				v2[j+1]:=aux;
				sigue:=true;
			end;
		end;
                i:=i+1;
	end;
	imprimirempanadazos(v2);
        readkey;
end;





//modifica los datos de una persona

procedure modificardatospersonales(var l:lista);
var
        actual:lista;
begin
        clrscr;
        if (l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        rta:='s';
        while(rta='s') do
        begin
                busquedadato(l,actual,r);
                if (r=1) then
                begin
                writeln;
                writeln;
                writeln('Ingrese nombre (en minuscula)');
                readln(i.nombre);
                writeln('Ingrese apellido (en minuscula)');
                readln(i.apellido);
                writeln('Ingrese telefono');
                readln(i.telefono);
                writeln('Ingrese edad');
                readln(i.edad);
                writeln('Ingrese domicilio');
                readln(i.domicilio);
                writeln('Ingrese DNI');
                readln(i.dni);
                writeln('Ingrese fecha de nacimiento');
                readln(i.nac);
                writeln('Ingrese mes de ingreso');
                readln(i.mes);
                        if (i.edad < 10) and (i.edad > 0) then
                                i.brigada:='Leniadores'
                                else
                                begin
                                if(i.edad<13) then
                                        i.brigada:='Pioneros'
                                        else
                                        begin
                                        if(i.edad<15) then
                                                i.brigada:='Conquistadores'
                                                else
                                                begin
                                                if(i.edad<19) then
                                                        i.brigada:='Halcones'
                                                        else
                                                        i.brigada:='Capitanes';
                                                end;
                                        end;
                                end;
        actual^.dato.nombre:=i.nombre;
        actual^.dato.apellido:=i.apellido;
        actual^.dato.telefono:=i.telefono;
        actual^.dato.edad:=i.edad;
        actual^.dato.domicilio:=i.domicilio;
        actual^.dato.brigada:=i.brigada;
        actual^.dato.mes:=i.mes;
        actual^.dato.dni:=i.dni;
        actual^.dato.nac:=i.nac;
        writeln;
        writeln('MODIFICADO');
        readln;
        end;
        writeln('Desea modificar otra persona?s/n?');
        readln(rta);
        end;
        end;
end;






//modifica los datos de un campamento
procedure modifcamp (var v:vector);
begin
        clrscr;
        imprimircampamento (v);
        write('Ingrese numero de campamento a modificar');
        readln(j);
        writeln;
        if ((j>0) and (j<6)) then
        begin
        writeln('Ingrese lugar del campamento');
        readln(i2.lugar);
        writeln('Ingrese fecha de inicio y termino');
        readln(i2.fecha);
        writeln('Ingrese precio');
        readln(i2.precio);
        v[1]:=i2;
        writeln('Ingrese alguna observacion si quisiese');
        readln(i2.observaciones);
        writeln;
        writeln('MODIFICADO');
        readkey;
        end
        else
        begin
                writeln('Opcion incorrecta');
                readkey;
        end;
end;





//modifica los datos de un empanadazo

procedure modifemp(var v2:vector2);
begin
        clrscr;
        imprimirempanadazos (v2);
        write('Ingrese empanadazo a modificar ');
        readln(j);
        writeln;
        if ((j<6) and (j>0)) then
        begin
        writeln('Ingrese fecha');
        readln(v2[j].fecha);
        writeln('Ingrese cantidad de docenas a preparar');
        readln(v2[j].dochechas);
        writeln('Ingrese precio por docena');
        readln(v2[j].precioxdoc);
        writeln;
        writeln('MODIFICADO');
        readkey;
        end
        else
        begin
                writeln('Opcion incorrecta');
                readkey;
        end;
end;




//Modifica los datos de un evento

procedure modificarevento(var v3:vector3);
begin
        clrscr;
        imprimireventos (v3);
        write('Ingrese evento a modificar ');
        readln(j);
        writeln;
        if ((j>0) and (j<6)) then
        begin
        writeln('Ingrese nombre');
        readln(v3[j].nom);
        writeln('Ingrese fecha');
        readln(v3[j].fecha);
        writeln('Ingrese precio');
        readln(v3[j].precio);
        writeln('Ingrese observaciones');
        readln(v3[j].observacion);
        v3[j].aux:=1;
        writeln;
        writeln('MODIFICADO');
        readkey;
        end
        else
        begin
                writeln('Opcion incorrecta');
                readkey;
end;
end;




//cuenta la cantidad de personas que hay ingresadas
//FUNCION


function contarpersonas(l:lista;j:integer):integer;
begin
        while (l<>nil) do
        begin
                l:=l^.psig;
                j:=j+1;
        end;
                contarpersonas:=j;
end;








//........................................ELIMINAR.............................................
//............................................................................................




//elimina una persona de la lista

procedure eliminarpersona (var l:lista);
var
        actual,sig,ant:lista;
        ap:string;
begin
        if (l=nil) then
        begin
                writeln('Lista vacia');
                writeln;
                readkey;
        end
        else
        begin
        rta:='s';
        while(rta='s') do
        begin
        writeln('Ingrese apellido');
        readln(ap);
        actual:=l;
        busquedafinal2 (l,ap,actual,ant,r);
        if(r=1) then
        begin
        if(ant=nil) then
                l:=l^.psig
        else
                ant^.psig:=actual^.psig;
        dispose(actual);
        writeln;
        writeln('Eliminado');
        writeln;
        end;
        writeln('Desea eliminar otra persona?s/n');
        readln(rta);
        end;
end;
end;





//Saca una persona de los participantes de participantes de un campamento seleccionado

procedure eliminarparticipante(v:vector; var l:lista);
var
        nom,ap,rta2:string;
        actual,sig:lista;
        q:integer;
begin
        if(l=nil) then
        begin
                writeln('Lista vacia');
                readkey;
        end
        else
        begin
        rta2:='s';
        clrscr;
        while (rta2='s') do
        begin
        imprimircampamento(v);
        writeln('Ingrese campamento a actualizar');
        readln(q);
        writeln;
        if ((q<6) and (q>0)) then
        begin
        if(v[q].precio>0) then
        begin
        actual:=l;
        busquedadato(l,actual,r);
                if (r=1) then
                begin
                case q of
                1:actual^.dato.camp1:='n';
                2:actual^.dato.camp2:='n';
                3:actual^.dato.camp3:='n';
                4:actual^.dato.camp4:='n';
                5:actual^.dato.camp5:='n';
                end;
        writeln;
        writeln('ELIMINADO');
        writeln;
        end;
        end
        else
        begin
                writeln('Campamento vacio');
                readkey;
                writeln;
        end
        end
        else
        begin
                writeln('Opcion incorrecta');
                readkey;
                writeln;
        end;
        writeln('Desea eliminar otro participante?s/n');
        readln(rta2);
        end;
        end;
end;





//Deja la lista "en 0", reinicia todo

procedure formateo (var l:lista; var v:vector; var v2:vector2);
var
actual:lista;
begin
        clrscr;
        writeln('Al formatear se perderan todos los datos');
        writeln;
        writeln('Desea continuar? s/n');
        readln(rta);
        if (rta='s') then
        begin
        actual:=l;
        while (l<>nil) do
        begin
                actual:=l;
                l:=l^.psig;
                dispose(actual);
        end;
        for j:= 1 to 5 do
        begin
                v[j].lugar:='';
                v[j].fecha:='';
                v[j].precio:=0;
                v[j].observaciones:='';
                v2[j].fecha:='';
                v2[j].dochechas:='';
                v2[j].precioxdoc:=0;
                v2[j].ventatot:=0;
                v2[j].ganancia:=0;
                v3[j].nom:='';
                v3[j].fecha:='';
                v3[j].precio:=0;
                v3[j].observacion:='';
                v3[j].aux:=0;
        end;
        writeln;
        delay(1000);
        writeln('Formateando');
        writeln;
        delay(1000);
        writeln('Reiniciando contadores');
        writeln;
        delay(1000);
        writeln('Vaciando listas');
        writeln;
        delay(1000);
        writeln('Preparando nuevos archivos');
        writeln;
        delay(1000);
        writeln('FORMATEO COMPLETO');
        writeln;
        writeln('Presione una tecla para continuar');
        readkey;
        end;
end;








                //..........................MENU PRINCIPAL.......................//


//muestras todas las posibles opciones a las cuales se puede acceder

procedure menu(var l:lista; var v:vector; var v2:vector2; var v3:vector3);
begin
        rta:='1';
        while (rta<>'0') do
        begin
        clrscr;
        writeln('MENU PRINCIPAL');
        writeln;
        writeln('1. Configuracion');
        writeln;
        writeln('2. Personas');
        writeln;
        writeln('3. Eventos');
        writeln;
        writeln('0. Salir');
        writeln;
        write('Ingrese opcion en numero ');
        readln(rta);
        case (rta) of
               '1':begin  //de menu1//
                        while (rta<>'3') do
                        begin
                                clrscr;
                                writeln('1. Formatear programa');
                                writeln;
                                writeln('2. Cambiar el anio');
                                writeln;
                                writeln('3. Salir');
                                writeln;
                                write('Ingrese opcion en numero ');
                                readln(rta);
                                case (rta) of
                                        '1':formateo(l,v,v2);
                                        '2':cambiaranio(l,v,v2);
                                        '3':writeln;
                                end;
                        end;
               end;
               '2':begin //de menu 1//
                        while(rta<>'00') do
                        begin
                                clrscr;
                                writeln('MENU DE PERSONAS');
                                writeln;
                                writeln('1. Ingresar personas');
                                writeln;
                                writeln('2. Modificar datos personales');
                                writeln;
                                writeln('3. Ingresar asistencia por sabado');
                                writeln;
                                writeln('4. Ver la lista de asistencia por sabado');
                                writeln;
                                writeln('5. Busqueda de personas');
                                writeln;
                                writeln('6. Ingresar pago de cuotas');
                                writeln;
                                writeln('7. Ver lista de pagos');
                                writeln;
                                writeln('8. Ver lista de personas');
                                writeln;
                                writeln('9. Ver la lista de personas por brigada');
                                writeln;
                                writeln('10. Eliminar personas');
                                writeln;
                                writeln('11. Contar la cantidad de personas');
                                writeln;
                                writeln('12. Busqueda de personas por brigada');
                                writeln;
                                writeln('00. Salir');
                                writeln;
                                if (l=nil) then
                                        writeln('ATENCION: NO HAY NINGUNA PERSONA INGRESADA AL SISTEMA');
                                writeln;
                                write('Ingrese opcion en numero ');
                                readln(rta);
                                case (rta) of
                                       '1':ingresopersonas(l);
                                       '2':modificardatospersonales(l);
                                       '3':agregarasistencia (l);
                                       '4':imprimirlistaasistencia(l);
                                       '5':busquedadato(l,act,r);
                                       '6':agregarpagocuotas(l);
                                       '7':imprimirlistapagos(l);
                                       '8':imprimirlistapersonas(l);
                                       '9':imprimirporbrigada(l);
                                       '10':eliminarpersona(l);
                                       '11':begin
                                                writeln;
                                                j:=0;
                                                j:=contarpersonas(l,j);
                                                writeln('Cantidad de personas ingresadas: ',j);
                                                readkey;
                                       end;
                                       '12':imprimirporbrigada2(l);
                                       '00':writeln;
                                end;
                        end;
                    end;

                '3':begin //de menu 1//
                        while (rta<>'4') do
                        begin
                                clrscr;
                                writeln('MENU DE EVENTOS');
                                writeln;
                                writeln('1. Campamentos');
                                writeln;
                                writeln('2. Empanadazos');
                                writeln;
                                writeln('3. Otros eventos');
                                writeln;
                                writeln('4. Salir');
                                writeln;
                                if (l=nil) then
                                        writeln('ATENCION: NO HAY NINGUNA PERSONA INGRESADA AL SISTEMA');
                                writeln;
                                write('Ingrese opcion en numero ');
                                readln(rta);
                                case (rta) of
                                        '1':begin
                                                while (rta<>'8') do
                                                begin
                                                        clrscr;
                                                        writeln('MENU DE CAMPAMENTOS');
                                                        writeln;
                                                        writeln('1. Agregar campamento');
                                                        writeln;
                                                        writeln('2. Modificar Campamentos');
                                                        writeln;
                                                        writeln('3. Mostar Campamentos');
                                                        writeln;
                                                        writeln('4. Ver participantes y pagos');
                                                        writeln;
                                                        writeln('5. Ingresar participantes');
                                                        writeln;
                                                        writeln('6. Ingresar pagos');
                                                        writeln;
                                                        writeln('7. Eliminar participantes');
                                                        writeln;
                                                        writeln('8. Salir');
                                                        writeln;
                                                        if (l=nil) then
                                                        writeln('ATENCION: NO HAY NINGUNA PERSONA INGRESADA AL SISTEMA');
                                                        writeln;
                                                        write('Ingrese una opcion en numero ');
                                                        readln(rta);
                                                        case (rta) of
                                                                '1':agregarcampamentos(v);
                                                                '2':modifcamp(v);
                                                                '3':begin
                                                                imprimircampamento(v);
                                                                readkey;
                                                                end;
                                                                '4':imprimirparticipantes(v,l);
                                                                '5':ingresarparticipante(v,l);
                                                                '6':ingresarpago(v,l);
                                                                '7':eliminarparticipante(v,l);
                                                                '8':writeln;


                                                        end;
                                                end;
                                        end;
                                         '2':begin
                                               while (rta<>'7') do
                                                begin
                                                        clrscr;
                                                        writeln('MENU DE EMPANADAZOS');
                                                        writeln;
                                                        writeln('1. Agregar Empanadazo');
                                                        writeln;
                                                        writeln('2. Modificar Empanadazo');
                                                        writeln;
                                                        writeln('3. Ver empanadazos');
                                                        writeln;
                                                        writeln('4. Ver ventas');
                                                        writeln;
                                                        writeln('5. Comparar con empanadazos anteriores');
                                                        writeln;
                                                        writeln('6. Ingresar ventas');
                                                        writeln;
                                                        writeln('7. Salir');
                                                        writeln;
                                                        if (l=nil) then
                                                        writeln('ATENCION: NO HAY NINGUNA PERSONA INGRESADA AL SISTEMA');
                                                        writeln;
                                                        write('Ingrese una opcion en numero ');
                                                        readln(rta);
                                                        case (rta) of
                                                                '1':agregarempanadazo(v2);
                                                                '2':modifemp(v2);
                                                                '3':begin
                                                                imprimirempanadazos(v2);
                                                                readkey;
                                                                end;
                                                                '4':imprimirventas(v2,l);
                                                                '5':ordenamiento(v2);
                                                                '6':actualizarventas(l);
                                                                '7':writeln;
                                                        end;
                                                end;
                                        end;
                                        '3':begin
                                                while (rta<>'4') do
                                                begin
                                                        clrscr;
                                                        writeln('1. Agregar evento');
                                                        writeln;
                                                        writeln('2. Ver eventos');
                                                        writeln;
                                                        writeln('3. Modificar evento');
                                                        writeln;
                                                        writeln('4. Salir');
                                                        writeln;
                                                        write('Ingrese opcion en numero ');
                                                        readln(rta);
                                                        case (rta) of
                                                                '1':agregarevento(v3);
                                                                '2':begin
                                                                imprimireventos(v3);
                                                                readkey;
                                                                end;
                                                                '3':modificarevento(v3);
                                                                '4':writeln;
                                                        end;
                                                end;
                                        end;


                                end;
                        end;
                        end;
                '0':begin //de menu 1//
                        writeln;
                        writeln('Saliendo del programa...');
                        writeln;
                        delay(1500);
                end;
        end;
        end;
end;







//......................................................
//CARGA Y DESCARGA DE DATOS DE ARCHIVO A LISTA Y DE LISTA A ARCHIVO!!!!!!!
//............................................................




//Pasa los datos de archivos a listas y vectores



procedure CARGAINICIAL(var arc:archivo; var arc2:archivo2;var arc3:archivo3;var arc4:archivo4; var l:lista; var v:vector; var v2:vector2; var v3:vector3);
var
j:integer;
begin
        j:=1;
        l:=nil;
        while not (eof(arc)) do
        begin
                read (arc,i);
                ag_ord(l,i);
        end;
        while not (eof(arc2)) do
        begin
                read(arc2,i2);
                v[j].lugar:=i2.lugar;
                v[j].fecha:=i2.fecha;
                v[j].precio:=i2.precio;
                v[j].observaciones:=i2.observaciones;
                j:=j+1;
        end;
        close(arc2);
        j:=1;
        while not (eof(arc3)) do
        begin
                read(arc3,i3);
                v2[j].fecha:=i3.fecha;
                v2[j].dochechas:=i3.dochechas;
                v2[j].precioxdoc:=0;
                v2[j].precioxdoc:=i3.precioxdoc;
                v2[j].ventatot:=i3.ventatot;
                v2[j].ganancia:=i3.ganancia;
                j:=j+1;
        end;
        close(arc3);
        j:=1;
        while not (eof(arc4)) do
        begin
                read(arc4,i4);
                v3[j].nom:=i4.nom;
                v3[j].fecha:=i4.fecha;
                v3[j].precio:=i4.precio;
                v3[j].observacion:=i4.observacion;
                v3[j].aux:=i4.aux;
                j:=j+1;
        end;
        close(arc4);
end;




 //Pasa los datos de listas y vectores a archivos


procedure listaaarchivo(var arc:archivo; var arc2:archivo2; var arc3:archivo3; var arc4:archivo4; l:lista);
begin
        while (l<>nil) do
        begin
                i:=l^.dato;
                write(arc,i);
                l:=l^.psig;
        end;
        close(arc);
        for j:= 1 to 5 do
        begin
                i2:=v[j];
                i3:=v2[j];
                i4:=v3[j];
                write(arc2,i2);
                write(arc3,i3);
                write(arc4,i4);
        end;
        close(arc2);
        close(arc3);
        close(arc4);
end;






procedure inicio;
var
i:integer;
begin
        i:=0;
        writeln('BIENVENIDO');
        writeln;
        writeln('INICIANDO PROGRAMA...');
        writeln;
        writeln;
        delay(1000);
        writeln('Descargando archivos');
        writeln;
        delay(1000);
        writeln('Actulizando listas');
        writeln;
        delay(1000);
        writeln('Creando interfaz');
        writeln;
        writeln;
        delay(1500);
        while (i<>105) do
        begin
                delay(50);
                writeln(i,'% completado');
                i:=i+5;
        end;
        writeln;
        writeln;
        writeln('PROGRAMA CARGADO');
        writeln;
        textcolor(green);
        highvideo;
        delay(1500);
end;






BEGIN(*.............................PRINCIPAL..........................................*)
clrscr;
Inicio;
assign(arc,'d:\d.dat');
assign(arc2,'d:\campamentos.dat');
assign(arc3,'d:\empanadazos.dat');
assign(arc4,'d:\eventos.dat');
reset(arc);
reset(arc2);
reset(arc3);
reset(arc4);
cargainicial (arc,arc2,arc3,arc4,l,v,v2,v3);
menu(l,v,v2,v3);
rewrite(arc);
rewrite(arc2);
rewrite(arc3);
rewrite(arc4);
listaaarchivo(arc,arc2,arc3,arc4,l);
end.
