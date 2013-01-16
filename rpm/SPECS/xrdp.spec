Name:           xrdp
Version:        0
Release:        8
Summary:        Install XRDP

Group:          Applications/Network
License:        Apache 2
URL:            http://www.github.com/FreeRDP/xrdp   
Vendor:		no
Packager:	Arvid <norrarvid@gmail.com>
BuildArchitectures: i386
# Requires: openssl
Prefix: %{_prefix}/etc/xrdp

%description
XRDP for CentOS binary only
# Nothing
%prep

%build

%post
/sbin/chkconfig --add xrdp

%preun
/sbin/chkconfig --del xrdp

%postun
rm /etc/init.d/xrdp -kill

%install

%clean

%files
#%defattr(-,root,root,-)
/usr/local/lib/xrdp
/etc/pam.d/
/etc/xrdp/
/usr/local/share/xrdp
/usr/local/bin/
/usr/local/sbin/

%doc

%changelog
* Mon Jan 14 2013 Arvid
- Created first initial version
