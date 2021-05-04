function simple_gui
%SIMPLE_GUI Select a data set from the pop-up menu, then
%click one of the plot-type push buttons. Clicking the button plots the
%selected data in the axes

f = figure('Visible','off','Position',[360,500,450,285]);

    hsurf = uicontrol('Style','pushbutton','String','Surf','Position',[315,220,70,25],'Callback',@surfbutton_Callback);
    
    hmesh = uicontrol('Style','pushbutton','String','Mesh','Position',[315,180,70,25],'Callback',@meshbutton_Callback);
    
    hcontour = uicontrol('Style','pushbutton','String','Contour','Position',[315,135,70,25],'Callback',@contourbutton_Callback);
    
    htext = uicontrol('Style','text','String','Select Data','Position',[325,90,60,15]);
    
    hpopup = uicontrol('Style','popupmenu','String',{'Peaks','Membrane','Sinc'},'Position',[300,50,100,25],'Callback',@popup_menu_Callback);
    
    ha = axes('Units','pixels','Position',[50,60,200,185]);
    
    align([hsurf,hmesh,hcontour,htext,hpopup],'Center','None');
    
    f.Units = 'normalized';
    ha.Units = 'normalized';
    hsurf.Units = 'normalized';
    hmesh.Units = 'normalized';
    hcontour.Units = 'normalized';
    htext.Units = 'normalized';
    hpopup.Units = 'normalized';
    
    peaks_data = peaks(35);
    membrane_data = membrane;
    [x,y] = meshgrid(-8:.5:8);
    r = sqrt(x.^2+y.^2) + eps;
    sinc_data = sin(r)./r;
    
    current_data = peaks_data;
    surf(current_data);
    
    f.Name = 'Simple GUI';
    
    movegui(f,'center')
    
    f.Visible = 'on';
    


function popup_menu_Callback(source,eventdata)
str = get(source, 'String');
val = get(source, 'Value');
switch str{val}
    case 'Peaks'
        current_data = peaks_data;
    case 'Membrane'
        current_data = membrane_data;
    case 'Sinc'
        current_data = sinc_data;
    end
end

    function surfbutton_Callback(source,eventdata)
    surf(current_data);
    end

    function meshbutton_Callback(source,eventdata)
    mesh(current_data);
    end
   
    function contourbutton_Callback(source,eventdata)
    contour(current_data);
    end
end