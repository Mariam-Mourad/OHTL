
function varargout = OHTL(varargin)
% OHTL MATLAB code for OHTL.fig
%      OHTL, by itself, creates a new OHTL or raises the existing
%      singleton*.
%
%      H = OHTL returns the handle to a new OHTL or the handle to
%      the existing singleton*.
%
%      OHTL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OHTL.M with the given input arguments.
%
%      OHTL('Property','Value',...) creates a new OHTL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OHTL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OHTL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OHTL

% Last Modified by GUIDE v2.5 24-Apr-2019 00:59:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OHTL_OpeningFcn, ...
                   'gui_OutputFcn',  @OHTL_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before OHTL is made visible.
function OHTL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OHTL (see VARARGIN)

% Choose default command line output for OHTL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%---->setting the unwanted controls unvsible
set(handles.text9,'visible','off')%unvisible no of strands
set(handles.edit2,'visible','off')%unvisible its edit text
set(handles.text11,'visible','off')%unvisible no of bundles
set(handles.bundles_pop,'visible','off')%unvisible its values
set(handles.text20,'visible','off')%unvisible GMR_L
set(handles.r_stranded,'visible','off')%its value
set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')
set(handles.radiobutton1,'Value',1)
global type
type=get(handles.type_pop,'value');
set(handles.text40,'visible','off')
set(handles.text41,'visible','off')
set(handles.text42,'visible','off')
set(handles.text43,'visible','off')
set(handles.gmd,'visible','off')
set(handles.text45,'visible','off')



% UIWAIT makes OHTL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OHTL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in material_pop.
function material_pop_Callback(hObject, eventdata, handles)
% hObject    handle to material_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns material_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from material_pop
contents_material = cellstr(get(hObject,'String'));
material_choice=contents_material{get(hObject,'Value')};
if(strcmp(material_choice,'Aluminum'))
    resistivity=2.65*(10^-8);
elseif(strcmp(material_choice,'Copper'))
    resistivity=1.68*(10^-8);
end
setappdata(0,'material_pop',resistivity)


% --- Executes during object creation, after setting all properties.
function material_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to material_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in type_pop.
function type_pop_Callback(hObject, eventdata, handles)
% hObject    handle to type_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns type_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from type_pop
global radio3 radio2 radio1 type
contents_type = cellstr(get(hObject,'String'));
cond_type=contents_type{get(hObject,'Value')};
if(strcmp(cond_type,'Solid'))
    set(handles.text9,'visible','off')
set(handles.edit2,'visible','off')
set(handles.text11,'visible','off')
set(handles.bundles_pop,'visible','off')
set(handles.text20,'visible','off')
set(handles.r_stranded,'visible','off')

elseif(strcmp(cond_type,'Stranded'))
    type=2
set(handles.text9,'visible','on')
set(handles.edit2,'visible','on')
set(handles.text20,'visible','on')
set(handles.r_stranded,'visible','on')
set(handles.text11,'visible','off')
set(handles.bundles_pop,'visible','off')



elseif(strcmp(cond_type,'Solid Bundled'))
    type=3

set(handles.text11,'visible','on')
set(handles.bundles_pop,'visible','on')
set(handles.text9,'visible','off')
set(handles.edit2,'visible','off')
set(handles.text20,'visible','off')
set(handles.r_stranded,'visible','off')



elseif(strcmp(cond_type,'Stranded Bundled'))
    type=4
set(handles.text9,'visible','on')
set(handles.edit2,'visible','on')
set(handles.text11,'visible','on')
set(handles.bundles_pop,'visible','on')
set(handles.text20,'visible','on')
set(handles.r_stranded,'visible','on')

end

% --- Executes during object creation, after setting all properties.
function type_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to type_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in bundles_pop.
function bundles_pop_Callback(hObject, eventdata, handles)
% hObject    handle to bundles_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bundles_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bundles_pop

contents_bundles = cellstr(get(hObject,'String'));
global No_bundles
No_bundles=contents_bundles{get(hObject,'Value')};


% --- Executes during object creation, after setting all properties.
function bundles_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bundles_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_stranded_Callback(hObject, eventdata, handles)
% hObject    handle to r_stranded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r_stranded as text
%        str2double(get(hObject,'String')) returns contents of r_stranded as a double


% --- Executes during object creation, after setting all properties.
function r_stranded_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_stranded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calc.
function calc_Callback(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global No_bundles radio1 radio2 radio3 type 
diameter=str2double(get(handles.edit1,'String'));
number_of_layers=str2double(get(handles.edit2,'String'));
number_of_strands=3*number_of_layers*(number_of_layers+1)+1;
GMR_L=str2double(get(handles.r_stranded,'String'));
resitivity=getappdata(0,'material_pop');
Dab=str2double(get(handles.dab,'String'));
Dbc=str2double(get(handles.dbc,'String'));
Dca=str2double(get(handles.dca,'String'));
d=str2double(get(handles.bund_d,'String'));
gmd=str2double(get(handles.edit9,'String'));
 
if (radio1==1 |radio2==1)
if(type==1)
    Area=pi*(diameter/2)^2;
    GMD=gmd;
    Geo_L=(diameter/2)*exp(-0.25);
    Geo_c=diameter/2;
elseif(type==2)
    Area=(pi*(diameter/2)^2)*number_of_strands;
    GMD=gmd;
    Geo_L=GMR_L;
    Geo_c=diameter/2;
elseif(type==3)
    Area=(pi*(diameter/2)^2)*str2double(No_bundles)
        switch No_bundles
            case '2'
                 Geo_L=((diameter/2)*exp(-0.25)*d)^.5 ;
                 Geo_c=((diameter/2)*d)^(1/2);
            case '3'
                Geo_L=((diameter/2)*exp(-0.25)*d^2)^(1/3);
                Geo_c=((diameter/2)*d^2)^(1/3);
            case '4'
                Geo_L=1.09*(((diameter/2)*exp(-0.25)*d^3)^(1/4)) ;
                Geo_c=1.09*((diameter/2)*d^3)^(1/4);
        end
     GMD=gmd;
             
elseif(type==4)
     Area=(pi*(diameter/2)^2)*number_of_strands*(str2double(No_bundles));
   switch No_bundles
            case '2'
                 Geo_L=(GMR_L*d)^.5;
                 Geo_c=((diameter/2)*d)^(1/2);
            case '3'
                Geo_L=(GMR_L*d^2)^(1/3)
                Geo_c=((diameter/2)*d^2)^(1/3)
            case '4'
                Geo_L=1.09*((GMR_L*d^3)^(1/4));
                Geo_c=1.09*((diameter/2)*d^3)^(1/4);
   end
    GMD=gmd;
end 
end
 
if(radio3==1)
    if(type==1)
    
    Area=pi*(diameter/2)^2;
    test=(Dab*Dbc*Dca);
    GMD=(Dab*Dbc*Dca)^(1/3);
     Geo_L=(diameter/2)*exp(-0.25);
       Geo_c=diameter/2;
elseif(type==2)
    Area=(pi*(diameter/2)^2)*number_of_strands;
    GMD=(Dab*Dbc*Dca)^(1/3);
     Geo_L=GMR_L;
      Geo_c=diameter/2;
elseif(type==3)
   Area=(pi*(diameter/2)^2)*str2double(No_bundles);
   GMD=(Dab*Dbc*Dca)^(1/3);
    switch No_bundles
            case '2'
                 Geo_L=((diameter/2)*exp(-0.25)*d)^.5;
                 Geo_c=((diameter/2)*d)^(1/2);
            case '3'
                Geo_L=((diameter/2)*exp(-0.25)*d^2)^(1/3);
                Geo_c=((diameter/2)*d^2)^(1/3);
            case '4'
                Geo_L=1.09*(((diameter/2)*exp(-0.25)*d^3)^(1/4));
                Geo_c=1.09*((diameter/2)*(d^3))^(1/4);
    end      
elseif(type==4)
     Area=(pi*(diameter/2)^2)*number_of_strands*str2double(No_bundles) ; 
    GMD=(Dab*Dbc*Dca)^(1/3);
    switch No_bundles
            case '2'
                 Geo_L=(GMR_L*d)^.5;
                 Geo_c=((diameter/2)*d)^(1/2);
            case '3'
                Geo_L=(GMR_L*d^2)^(1/3);
                Geo_c=((diameter/2)*d^2)^(1/3);
                flag=3
            case '4'
                Geo_L=1.09*((GMR_L*d^3)^(1/4));
                Geo_c=1.09*((diameter/2)*(d^3))^(1/4);
               
    end
    end
end
   
resistance=resitivity/(Area*1000);
inductance=0.2*log(GMD/Geo_L);
capacitance= 0.0556/(log(GMD/Geo_c));
   
set(handles.area,'string',Area);
set(handles.gmd,'string',GMD);
    set(handles.gmr_l,'string',Geo_L);
    set(handles.gmr_c,'string',Geo_c);
    set(handles.R,'string',resistance);
    set(handles.L,'string',inductance);
    set(handles.cap,'string',capacitance);
 
    
 setappdata(0,'calc_Callback',inductance)
 set(handles.text42,'string',inductance*2)

  

% --- Executes during object creation, after setting all properties.
function text9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function text9_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global radio1 type radio2 radio3
radio1=get(hObject,'Value')

if (radio1==1)
       set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')
radio2=0;
radio3=0;
end
if(type==1|type==2 |type==3 |type==4)
          set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','on')
set(handles.bund_d,'visible','on')
end
inductance=getappdata(0,'calc_Callback')
set(handles.text40,'visible','on')
 set(handles.text41,'visible','on')
 set(handles.text42,'visible','on')
set(handles.text43,'visible','off')
set(handles.gmd,'visible','off')
set(handles.text45,'visible','off')
set(handles.text14,'visible','on')
set(handles.text31,'visible','on')
set(handles.edit9,'visible','on')




function dab_Callback(hObject, eventdata, handles)
% hObject    handle to dab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dab as text
%        str2double(get(hObject,'String')) returns contents of dab as a double


% --- Executes during object creation, after setting all properties.
function dab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dbc_Callback(hObject, eventdata, handles)
% hObject    handle to dbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dbc as text
%        str2double(get(hObject,'String')) returns contents of dbc as a double


% --- Executes during object creation, after setting all properties.
function dbc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dca_Callback(hObject, eventdata, handles)
% hObject    handle to dca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dca as text
%        str2double(get(hObject,'String')) returns contents of dca as a double


% --- Executes during object creation, after setting all properties.
function dca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bund_d_Callback(hObject, eventdata, handles)
% hObject    handle to bund_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bund_d as text
%        str2double(get(hObject,'String')) returns contents of bund_d as a double


% --- Executes during object creation, after setting all properties.
function bund_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bund_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global radio2 type radio1 radio3
radio2=get(hObject,'Value')
if (radio2==1)
       set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')
radio1=0;
radio3=0;
end
if(type==1|type==2 |type==3 |type==4)
          set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')
end
set(handles.text40,'visible','off')
set(handles.text41,'visible','off')
set(handles.text42,'visible','off')
set(handles.text43,'visible','off')
set(handles.gmd,'visible','off')
set(handles.text45,'visible','off')
set(handles.text14,'visible','on')
set(handles.edit9,'visible','on')
set(handles.text31,'visible','on')
% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global radio3 radio1 radio2 type
radio3=get(hObject,'Value')

    if(radio3==1)  
    if(type==3 | type==4)
set(handles.Dab,'visible','on')
set(handles.Dbc,'visible','on')
set(handles.Dca,'visible','on')
set(handles.dab,'visible','on')
set(handles.dbc,'visible','on')
set(handles.dca,'visible','on')
set(handles.text38,'visible','on')
set(handles.bund_d,'visible','on')

    elseif(type==1 | type==2)
set(handles.Dab,'visible','on')
set(handles.Dbc,'visible','on')
set(handles.Dca,'visible','on')
set(handles.dab,'visible','on')
set(handles.dbc,'visible','on')
set(handles.dca,'visible','on')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')
else
    set(handles.Dab,'visible','off')
set(handles.Dbc,'visible','off')
set(handles.Dca,'visible','off')
set(handles.dab,'visible','off')
set(handles.dbc,'visible','off')
set(handles.dca,'visible','off')
set(handles.text38,'visible','off')
set(handles.bund_d,'visible','off')

    end 
    radio1=0;
    radio2=0;
    end

set(handles.text40,'visible','off')
set(handles.text41,'visible','off')
set(handles.text42,'visible','off')
set(handles.text14,'visible','off')
set(handles.edit9,'visible','off')
set(handles.text31,'visible','off')
set(handles.text43,'visible','on')
set(handles.gmd,'visible','on')
set(handles.text45,'visible','on')
    


% --- Executes during object creation, after setting all properties.
function group1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to group1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 


% --- Executes when selected object is changed in group1.
function group1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in group1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
