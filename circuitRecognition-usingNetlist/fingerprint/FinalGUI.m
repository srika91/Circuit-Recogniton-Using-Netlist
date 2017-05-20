function varargout = FinalGUI(varargin)
% FINALGUI MATLAB code for FinalGUI.fig
%      FINALGUI, by itself, creates a new FINALGUI or raises the existing
%      singleton*.
%
%      H = FINALGUI returns the handle to a new FINALGUI or the handle to
%      the existing singleton*.
%
%      FINALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALGUI.M with the given input arguments.
%
%      FINALGUI('Property','Value',...) creates a new FINALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FinalGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FinalGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FinalGUI

% Last Modified by GUIDE v2.5 08-Mar-2011 00:06:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FinalGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FinalGUI_OutputFcn, ...
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


% --- Executes just before FinalGUI is made visible.
function FinalGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

set(handles.Binarize,'enable','on');
%set(handles.AutomaticBW,'enable','off');
%set(handles.ManualBW,'enable','off');
set(handles.Thining,'enable','off');
set(handles.FindMinutia,'enable','off');
set(handles.RemoveFalseMinutia,'enable','off');
set(handles.RegionOfInterest,'enable','off');

set(handles.radiobutton1,'enable','off');
set(handles.radiobutton2,'enable','off');
set(handles.radiobutton3,'enable','off');
%set(handles.ManualROI,'enable','off');
%set(handles.AutomaticROI,'enable','off');
%set(handles.Orientation,'enable','off');
%set(handles.Validation,'enable','off');
%s%et(handles.OriginalImage,'enable','off');
%set(handles.Skeleton,'enable','off');
%set(handles.Termination,'enable','off');
%set(handles.Bifurcation,'enable','off');
set(handles.ExportMinutia,'enable','off');

% UIWAIT makes FinalGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FinalGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Thining.
function Thining_Callback(hObject, eventdata, handles)
% hObject    handle to Thining (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%J=getappdata(handles.FinalGUI,'J');
J=getappdata(handles.radiobutton2,'J');
K=bwmorph(~J,'thin','inf');
%setappdata(handles.FinalGUI,'K',K);
setappdata(handles.radiobutton3,'K',K);
set(handles.FindMinutia,'enable','on');
axes(handles.axes1)
image(255*K),colormap(gray)
set(gca,'tag','axes1')


% --- Executes on button press in FindMinutia.
function FindMinutia_Callback(hObject, eventdata, handles)

% hObject    handle to FindMinutia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
K=getappdata(handles.radiobutton3,'K');
fun=@minutie;
L = nlfilter(K,[3 3],fun);
%% Termination
LTerm=(L==1);
LTermLab=bwlabel(LTerm);
propTerm=regionprops(LTermLab,'Centroid');
CentroidTerm=round(cat(1,propTerm(:).Centroid));

%% Bifurcation
LBif=(L==3);
LBifLab=bwlabel(LBif);
propBif=regionprops(LBifLab,'Centroid','Image');
CentroidBif=round(cat(1,propBif(:).Centroid));
D=6;

%% Middle point
MTerm=(L==2);
MTermLab=bwlabel(MTerm);
propMid=regionprops(MTermLab,'Centroid');
CentroidMid=round(cat(1,propMid(:).Centroid));
%% Process 1
Distance=DistEuclidian(CentroidBif,CentroidTerm);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidBif(i,:)=[];
CentroidTerm(j,:)=[];

%% Process 2
Distance=DistEuclidian(CentroidBif);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidBif(i,:)=[];


%% Process 3
Distance=DistEuclidian(CentroidTerm);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidTerm(i,:)=[];

d=15

%% Process 4
Distance=DistEuclidian(CentroidBif,CentroidMid);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
%%CentroidBif(i,:)=[];
CentroidMid(j,:)=[];

%% Process 5
Distance=DistEuclidian(CentroidMid,CentroidTerm);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
CentroidMid(i,:)=[];
%%CentroidTerm(j,:)=[];

%% Process 6
Distance=DistEuclidian(CentroidMid);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
CentroidMid(i,:)=[];


setappdata(handles.radiobutton4,'CentroidTerm',CentroidTerm);
%setappdata(handles.FinalGUI,'CentroidTermY',CentroidTermY);
setappdata(handles.radiobutton5,'CentroidBif',CentroidBif);
%setappdata(handles.FinalGUI,'CentroidBifY',CentroidBifY);
setappdata(handles.radiobutton6,'CentroidMid',CentroidMid);
set(handles.radiobutton4,'enable','off');
set(handles.radiobutton5,'enable','off');
set(handles.radiobutton6,'enable','off');
set(handles.radiobutton7,'enable','off');
axes(handles.axes1)
image(255*K),colormap(gray)
set(gca,'tag','axes1')
hold on
plot((CentroidTerm(:,1)),(CentroidTerm(:,2)),'ro')
plot((CentroidBif(:,1)),(CentroidBif(:,2)),'go')
plot((CentroidMid(:,1)),(CentroidMid(:,2)),'yo')

hold off
set(handles.RegionOfInterest,'enable','on');

%setappdata(handles.FinalGUI,'CentroidMidY',CentroidMidY);
% --- Executes on button press in RegionOfInterest.
function RegionOfInterest_Callback(hObject, eventdata, handles)
% hObject    handle to RegionOfInterest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(handles.radiobutton1,'I');
J=getappdata(handles.radiobutton2,'J');
CentroidTerm=getappdata(handles.radiobutton4,'CentroidTerm');
CentroidBif=getappdata(handles.radiobutton5,'CentroidBif');
CentroidMid=getappdata(handles.radiobutton6,'CentroidMid');
K=getappdata(handles.radiobutton3,'K');
Kopen=imclose(K,strel('square',7));
KopenClean= imfill(Kopen,'holes');
KopenClean=bwareaopen(KopenClean,5);
KopenClean([1 end],:)=0;
KopenClean(:,[1 end])=0;
ROI=imerode(KopenClean,strel('disk',10));
setappdata(handles.radiobutton7,'ROI',ROI);
set(handles.RemoveFalseMinutia,'enable','on');
axes(handles.axes1)
image(255*(J)),colormap(gray)
set(gca,'tag','axes1')
hold on
plot((CentroidTerm(:,1)),(CentroidTerm(:,2)),'ro')
plot((CentroidBif(:,1)),(CentroidBif(:,2)),'go')
plot((CentroidMid(:,1)),(CentroidMid(:,2)),'yo')


% --- Executes on button press in RemoveFalseMinutia.
function RemoveFalseMinutia_Callback(hObject, eventdata, handles)
% hObject    handle to RemoveFalseMinutia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CentroidTerm=getappdata(handles.radiobutton4,'CentroidTerm');
CentroidBif=getappdata(handles.radiobutton5,'CentroidBif');
CentroidMid=getappdata(handles.radiobutton6,'CentroidMid');
ROI=getappdata(handles.radiobutton7,'ROI');
I=getappdata(handles.radiobutton1,'I');
K=getappdata(handles.radiobutton3,'K');
[m,n]=size(I(:,:,1));
indTerm=sub2ind([m,n],CentroidTerm(:,1),CentroidTerm(:,2));
Z=zeros(m,n);
Z(indTerm)=1;
ZTerm=Z.*ROI';
[CentroidTermX,CentroidTermY]=find(ZTerm);

indBif=sub2ind([m,n],CentroidBif(:,1),CentroidBif(:,2));
Z=zeros(m,n);
Z(indBif)=1;
ZBif=Z.*ROI';
[CentroidBifX,CentroidBifY]=find(ZBif);

indMid=sub2ind([m,n],CentroidMid(:,1),CentroidMid(:,2));
Z=zeros(m,n);
Z(indMid)=1;
ZMid=Z.*ROI';
[CentroidMidX,CentroidMidY]=find(ZMid);
setappdata(handles.radiobutton8,'CentroidTermX',CentroidTermX);
setappdata(handles.radiobutton9,'CentroidTermY',CentroidTermY);
setappdata(handles.radiobutton10,'CentroidBifX',CentroidBifX);
setappdata(handles.radiobutton11,'CentroidBifY',CentroidBifY);
setappdata(handles.radiobutton12,'CentroidMidX',CentroidMidX);
setappdata(handles.radiobutton13,'CentroidMidY',CentroidMidY);
set(handles.ExportMinutia,'enable','on');
axes(handles.axes1)
image(255*K),colormap(gray)
set(gca,'tag','axes1')
plot(CentroidTermX,CentroidTermY,'ro','linewidth',2)
plot(CentroidBifX,CentroidBifY,'go','linewidth',2)
plot(CentroidMidX,CentroidMidY,'yo','linewidth',2)


% --- Executes on button press in ExportMinutia.
function ExportMinutia_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMinutia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CentroidBifX=getappdata(handles.radiobutton10,'CentroidBifX');
CentroidBifY=getappdata(handles.radiobutton11,'CentroidBifY');
%OrientationSep=getappdata(handles.FinalGUI,'OrientationSep');
MinutiaSep=[CentroidBifX CentroidBifY ];
CentroidTermX=getappdata(handles.radiobutton8,'CentroidTermX');
CentroidTermY=getappdata(handles.radiobutton9,'CentroidTermY');
%OrientationFin=getappdata(handles.FinalGUI,'OrientationFin');
MinutiaFin=[CentroidTermX CentroidTermY ];
CentroidMidX=getappdata(handles.radiobutton12,'CentroidMidX');
CentroidMidY=getappdata(handles.radiobutton13,'CentroidMidY');
MinutiaMid=[CentroidMidX CentroidMidY];
prompt = {'Enter file name:'};
dlg_title = 'Input for Minutia export';
num_lines = 1;
def = {''};
answer = inputdlg(prompt,dlg_title,num_lines,def);
saveMinutia(answer{1},MinutiaFin,MinutiaSep,MinutiaMid);

% --- Executes on button press in Binarize.
function Binarize_Callback(hObject, eventdata, handles)
% hObject    handle to Binarize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%I=getappdata(handles.FinalGUI,'I');
I=getappdata(handles.radiobutton1,'I');
J=I(:,:,1)>160;
%setappdata(handles.FinalGUI,'J',J);
setappdata(handles.radiobutton2,'J',J);
set(handles.Thining,'enable','on');
axes(handles.axes1)
image(I),colormap(gray)
set(gca,'tag','axes1')



% --------------------------------------------------------------------
function untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[f,rep]=uigetfile('*.bmp');
I=imread([rep,f]);
I=imresize(I,[300 300]);
%set(handles.OriginalImage,'enable','on');
%set(handles.Display,'enable','on');
%set(handles.AutomaticBW,'enable','on');
%setappdata(handles.FinalGUI,'axes1',OriginalImage);
setappdata(handles.radiobutton1,'I',I);
axes(handles.axes1)
image(I)
set(gca,'tag','axes1')

%set(handles.ManualBW,'enable','on');
set(handles.Binarize,'enable','on');
%set(handles.OriginalImage,'value',1);
%setappdata(handles.FinalGUI,'OriginalImage',OriginalImage);

%Display_Callback(handles.Display,eventdata,handles);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%function ExportMinutia_Callback(hObject, eventdata, handles)
CentroidBifX=getappdata(handles.FinalGUI,'CentroidBifX');
CentroidBifY=getappdata(handles.FinalGUI,'CentroidBifY');
OrientationSep=getappdata(handles.FinalGUI,'OrientationSep');
MinutiaSep=[CentroidBifX CentroidBifY OrientationSep];
CentroidTermX=getappdata(handles.FinalGUI,'CentroidTermX');
CentroidTermY=getappdata(handles.FinalGUI,'CentroidTermY');
OrientationFin=getappdata(handles.FinalGUI,'OrientationFin');
MinutiaFin=[CentroidTermX CentroidTermY OrientationFin];
CentroidMidX=getappdata(handles.FinalGUI,'CentroidMidX');
CentroidMidY=getappdata(handles.FinalGUI,'CentroidMidY');
MinutiaMid=[CentroidMidX CentroidMidY];
prompt = {'Enter file name:'};
dlg_title = 'Input for Minutia export';
num_lines = 1;
def = {''};
answer = inputdlg(prompt,dlg_title,num_lines,def);
saveMinutia(answer{1},MinutiaFin,MinutiaSep,MinutiaMid);
function Untitled_1_Callback(hObject, eventdata, handles)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
