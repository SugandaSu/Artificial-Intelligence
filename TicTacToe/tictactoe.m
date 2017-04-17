function varargout = tictactoe(varargin)
% TICTACTOE MATLAB code for tictactoe.fig
%      TICTACTOE, by itself, creates a new TICTACTOE or raises the existing
%      singleton*.
%
%      H = TICTACTOE returns the handle to a new TICTACTOE or the handle to
%      the existing singleton*.
%
%      TICTACTOE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TICTACTOE.M with the given input arguments.
%
%      TICTACTOE('Property','Value',...) creates a new TICTACTOE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tictactoe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tictactoe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tictactoe

% Last Modified by GUIDE v2.5 17-Apr-2017 15:25:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tictactoe_OpeningFcn, ...
                   'gui_OutputFcn',  @tictactoe_OutputFcn, ...
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

% --- Executes just before tictactoe is made visible.
function tictactoe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tictactoe (see VARARGIN)

% Choose default command line output for tictactoe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tictactoe wait for user response (see UIRESUME)
% uiwait(handles.figure1);

board = Board;
handles.board = board;
guidata(hObject,handles);
handles.start = 0;
guidata(hObject,handles);

% --- Outputs from this function are returned to the command line.
function varargout = tictactoe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton1,'String'))) && (handles.start == 1)
    set(handles.pushbutton1,'String','X')
    AIMove(hObject, eventdata, handles, [1,1]);
end

% --- Executes on button press in pushbutton1.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton2,'String'))) && (handles.start == 1)
    set(handles.pushbutton2,'String','X')
    AIMove(hObject, eventdata, handles, [1,2]);
end

% --- Executes on button press in pushbutton2.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton3,'String'))) && (handles.start == 1)
    set(handles.pushbutton3,'String','X')
    AIMove(hObject, eventdata, handles, [1,3]);
end

% --- Executes on button press in pushbutton3.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton4,'String'))) && (handles.start == 1)
    set(handles.pushbutton4,'String','X')
    AIMove(hObject, eventdata, handles, [2,1]);
end

% --- Executes on button press in pushbutton4.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton5,'String'))) && (handles.start == 1)
    set(handles.pushbutton5,'String','X')
    AIMove(hObject, eventdata, handles, [2,2]);
end

% --- Executes on button press in pushbutton5.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton6,'String'))) && (handles.start == 1)
    set(handles.pushbutton6,'String','X')
    AIMove(hObject, eventdata, handles, [2,3]);
end

% --- Executes on button press in pushbutton6.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton7,'String'))) && (handles.start == 1)
    set(handles.pushbutton7,'String','X')
    AIMove(hObject, eventdata, handles, [3,1]);
end

% --- Executes on button press in pushbutton7.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton8,'String'))) && (handles.start == 1)
    set(handles.pushbutton8,'String','X')
    AIMove(hObject, eventdata, handles, [3,2]);
end

% --- Executes on button press in pushbutton8.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isempty(get(handles.pushbutton9,'String'))) && (handles.start == 1)
    set(handles.pushbutton9,'String','X')
    AIMove(hObject, eventdata, handles, [3,3]);
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
board = Board;
handles.board = board;
guidata(hObject,handles);
handles.start = 1;
guidata(hObject,handles);
set(handles.text2,'String','On');
set(handles.pushbutton1,'String','');
set(handles.pushbutton2,'String','');
set(handles.pushbutton3,'String','');
set(handles.pushbutton4,'String','');
set(handles.pushbutton5,'String','');
set(handles.pushbutton6,'String','');
set(handles.pushbutton7,'String','');
set(handles.pushbutton8,'String','');
set(handles.pushbutton9,'String','');

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Implement AI move
function AIMove(hObject, eventdata, handles, numberGrid)

handles.board.Status(numberGrid(1),numberGrid(2)) = 2;
guidata(hObject,handles);

if handles.board.isTerminal == 9
    msgbox('Seri');
    set(handles.text2,'String','Off');
    handles.start = 0;
    guidata(hObject,handles);
elseif handles.board.isTerminal == 2
    msgbox('Anda Menang');
    set(handles.text2,'String','Off');
    handles.start = 0;
    guidata(hObject,handles);
else
    move = AplhabetaMinimax(handles.board, 0, -10000, 10000, 1)
    handles.board = move.board;
    guidata(hObject,handles);
    handles.board.Status
    if move.numberGrid == 1
        set(handles.pushbutton1,'String','O')
    elseif move.numberGrid == 2
        set(handles.pushbutton2,'String','O')
    elseif move.numberGrid == 3
        set(handles.pushbutton3,'String','O')
    elseif move.numberGrid == 4
        set(handles.pushbutton4,'String','O')
    elseif move.numberGrid == 5
        set(handles.pushbutton5,'String','O')
    elseif move.numberGrid == 6
        set(handles.pushbutton6,'String','O')
    elseif move.numberGrid == 7
        set(handles.pushbutton7,'String','O')
    elseif move.numberGrid == 8
        set(handles.pushbutton8,'String','O')
    elseif move.numberGrid == 9
        set(handles.pushbutton9,'String','O')    
    end
    if handles.board.isTerminal == 1
        msgbox('Komputer Menang');
        set(handles.text2,'String','Off');
        handles.start = 0;
        guidata(hObject,handles);
    end
end
