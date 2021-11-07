Name:           flat-remix-gtk
Version: 20201129
Release:        1
License:        GPLv3
Summary:        Flat Remix GTK theme
Url:            https://drasite.com/flat-remix-gtk
Group:          User Interface/Desktops
Source:         https://github.com/daniruiz/%{name}/archive/%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
BuildRequires:  make

%description
Flat Remix GTK theme is a pretty simple gtk window theme inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders.


%prep
%setup -q

%install
%make_install

%build


%post


%postun


%files
%doc LICENSE README.md
%{_datadir}/themes/Flat-Remix-Dark-Metacity
%{_datadir}/themes/Flat-Remix-Dark-XFWM
%{_datadir}/themes/Flat-Remix-Dark-XFWM-HiDPI
%{_datadir}/themes/Flat-Remix-Dark-XFWM-xHiDPI
%{_datadir}/themes/Flat-Remix-GTK-Black-Light
%{_datadir}/themes/Flat-Remix-GTK-Black-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Blue-Dark
%{_datadir}/themes/Flat-Remix-GTK-Blue-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Blue-Light
%{_datadir}/themes/Flat-Remix-GTK-Blue-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Brown-Dark
%{_datadir}/themes/Flat-Remix-GTK-Brown-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Brown-Light
%{_datadir}/themes/Flat-Remix-GTK-Brown-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Cyan-Dark
%{_datadir}/themes/Flat-Remix-GTK-Cyan-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Cyan-Light
%{_datadir}/themes/Flat-Remix-GTK-Cyan-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green-Dark
%{_datadir}/themes/Flat-Remix-GTK-Green-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green-Light
%{_datadir}/themes/Flat-Remix-GTK-Green-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Grey-Dark
%{_datadir}/themes/Flat-Remix-GTK-Grey-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Grey-Light
%{_datadir}/themes/Flat-Remix-GTK-Grey-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Magenta-Dark
%{_datadir}/themes/Flat-Remix-GTK-Magenta-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Magenta-Light
%{_datadir}/themes/Flat-Remix-GTK-Magenta-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Orange-Dark
%{_datadir}/themes/Flat-Remix-GTK-Orange-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Orange-Light
%{_datadir}/themes/Flat-Remix-GTK-Orange-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red-Dark
%{_datadir}/themes/Flat-Remix-GTK-Red-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red-Light
%{_datadir}/themes/Flat-Remix-GTK-Red-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Teal-Dark
%{_datadir}/themes/Flat-Remix-GTK-Teal-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Teal-Light
%{_datadir}/themes/Flat-Remix-GTK-Teal-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-Violet-Dark
%{_datadir}/themes/Flat-Remix-GTK-Violet-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Violet-Light
%{_datadir}/themes/Flat-Remix-GTK-Violet-Light-Solid
%{_datadir}/themes/Flat-Remix-GTK-White-Dark
%{_datadir}/themes/Flat-Remix-GTK-White-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Dark
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Light
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Light-Solid
%{_datadir}/themes/Flat-Remix-Light-Metacity
%{_datadir}/themes/Flat-Remix-Light-XFWM
%{_datadir}/themes/Flat-Remix-Light-XFWM-HiDPI
%{_datadir}/themes/Flat-Remix-Light-XFWM-xHiDPI

