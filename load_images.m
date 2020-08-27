function varargout = load_images(varargin)
% load_images MATLAB code for load_images.fig
%      load_images, by itself, creates a new load_images or raises the existing
%      singleton*.
%
%      H = load_images returns the handle to a new load_images or the handle to
%      the existing singleton*.
%
%      load_images('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in load_images.M with the given input arguments.
%
%      load_images('Property','Value',...) creates a new load_images or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_images_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_images_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_images

% Last Modified by GUIDE v2.5 16-Dec-2019 13:22:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_images_OpeningFcn, ...
                   'gui_OutputFcn',  @load_images_OutputFcn, ...
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


% --- Executes just before load_images is made visible.
function load_images_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_images (see VARARGIN)

% Choose default command line output for load_images
saved_dir = 'image_captured';

handles.output = hObject;
set(handles.pushbutton0,'CData',imresize(imread([saved_dir '/pic6.jpg']),0.2));
set(handles.pushbutton1,'CData',imresize(imread([saved_dir '/pic5.jpg']),0.2));
set(handles.pushbutton2,'CData',imresize(imread([saved_dir '/pic4.jpg']),0.2));
set(handles.pushbutton3,'CData',imresize(imread([saved_dir '/pic3.jpg']),0.2));
set(handles.pushbutton4,'CData',imresize(imread([saved_dir '/pic2.jpg']),0.2));
set(handles.pushbutton5,'CData',imresize(imread([saved_dir '/pic1.jpg']),0.2));


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes load_images wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_images_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton0.
function pushbutton0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic6.jpg', options(1), options(2), options(3), options(4));


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic5.jpg', options(1), options(2), options(3), options(4));



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic4.jpg', options(1), options(2), options(3), options(4));



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic3.jpg', options(1), options(2), options(3), options(4));



% --- Executes on button press in pushbutton5.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic2.jpg', options(1), options(2), options(3), options(4));



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = loadOptions(handles);
load_main('pic1.jpg', options(1), options(2), options(3), options(4));

function [ options ] = loadOptions(handles)
dark_background = get(handles.checkbox, 'Value');
retrain = get(handles.checkbox2, 'Value');
add_to_DS = get(handles.checkbox3, 'Value');
current_number = get(handles.edit, 'String');
if isempty( current_number )
    current_number = '-1';
end
options = [dark_background retrain add_to_DS current_number];


function load_main (image_name, dark_background, retrain, add_to_DS, current_number)
current_number = str2double(current_number);
if add_to_DS
    if ismember(current_number ,[0 1 2 3 4 5])
        main(image_name, dark_background, retrain, add_to_DS, current_number)
    else
        disp('Please choose number from 0 to 5');
    end
else
    main(image_name, dark_background, retrain, add_to_DS, current_number)
end
