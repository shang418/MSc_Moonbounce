
function varargout = AZEL_conversion_OutputFcn(hObject, eventdata, handles)
% varargout cell array for returning output args (see VARARGOUT);
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
45
varargout{1} = handles.output;
function ImageClickCallback ( objectHandle , eventData, handles )
axesHandle = get(objectHandle,'Parent');
coordinates = get(axesHandle,'CurrentPoint');
coordinates = coordinates(1,1:2);
handles = guihandles(); %define handles to be used in GUI
set(handles.Lat, 'string', coordinates(2));
set(handles.Long, 'string', coordinates(1));
