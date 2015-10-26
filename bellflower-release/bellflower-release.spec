Name:		bellflower-release
Version:	6
Release:	2%{?dist}
Summary:	Bellflower's RPM repository

Group:		System Environment/Base
License:	MIT
URL:		http://bellflower.web4u.jp/
Source0:	http://bellflower.web4u.jp/downloads/centos/RPM-GPG-KEY-BELLFLOWER
Source1:	LICENSE
Source2:	bellflower.repo

BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildArch:	noarch
Requires:	redhat-release >=  %{version}


%description
%{summary}


%prep
%setup -q -c -T
install -pm 644 %{SOURCE0} .
install -pm 644 %{SOURCE1} .


%build


%install
rm -rf $RPM_BUILD_ROOT

#GPG Key
install -dm 755 $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg
install -pm 644 %{SOURCE0} $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg

# yum
install -dm 755 $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE2} $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d


%clean
rm -rf $RPM_BUILD_ROOT


%post


%postun


%files
%defattr(-,root,root,-)
%doc LICENSE
%config(noreplace) /etc/yum.repos.d/*
/etc/pki/rpm-gpg/*


%changelog
* Mon Oct 26 2015 Kikyou Akino <bellflower@web4u.jp> 6-2
- Add GPG key

* Sun Oct 18 2015 Kikyou Akino <bellflower@web4u.jp> - 6-1
- Create Package
