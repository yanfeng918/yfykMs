/*
 * 
 * 
 * 
 */
package com.yfyk.shiro;


import com.yfyk.bean.Setting;
import com.yfyk.common.service.ICaptchaService;
import com.yfyk.entity.Admin;
import com.yfyk.service.AdminService;
import com.yfyk.utils.SettingUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 权限认证
 * 
 * 
 * 
 */
public class AuthenticationRealm extends AuthorizingRealm {

	@Autowired
	private ICaptchaService captchaService;
	@Autowired
	private AdminService adminService;
	
	

	/**
	 * 获取认证信息
	 * 
	 * @param token
	 *            令牌
	 * @return 认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken token) {
        AuthenticationToken authenticationToken = (AuthenticationToken) token;
        String username = authenticationToken.getUsername();
        String password = new String(authenticationToken.getPassword());
        String captchaId = authenticationToken.getCaptchaId();
        String captcha = authenticationToken.getCaptcha();
        String ip = authenticationToken.getHost();

        if (!captchaService.isValid(Setting.CaptchaType.adminLogin, captchaId, captcha)) {
            throw new UnsupportedTokenException();
        }
        if (username != null && password != null) {
            Admin admin = adminService.findByUsername(username);
            if (admin == null) {
                throw new UnknownAccountException();
            }
            if (!admin.getIsenabled()) {
                throw new DisabledAccountException();
            }
            Setting setting = SettingUtils.get();
            if (admin.getIslocked()) {
                if (ArrayUtils.contains(setting.getAccountLockTypes(), Setting.AccountLockType.admin)) {
                    int loginFailureLockTime = setting.getAccountLockTime();
                    if (loginFailureLockTime == 0) {
                        throw new LockedAccountException();
                    }
                    Date lockedDate = admin.getLockeddate();
                    Date unlockDate = DateUtils.addMinutes(lockedDate, loginFailureLockTime);
                    if (new Date().after(unlockDate)) {
                        admin.setLoginfailurecount(0);
                        admin.setIslocked(false);
                        admin.setLockeddate(null);
                        adminService.update(admin);
                    } else {
                        throw new LockedAccountException();
                    }
                } else {
                    admin.setLoginfailurecount(0);
                    admin.setIslocked(false);
                    admin.setLockeddate(null);
                    adminService.update(admin);
                }
            }
            System.out.print(DigestUtils.md5Hex("123123"));
            if (!DigestUtils.md5Hex(password).equals(admin.getPassword())) {
                int loginFailureCount = admin.getLoginfailurecount() + 1;
                if (loginFailureCount >= setting.getAccountLockCount()) {
                    admin.setIslocked(true);
                    admin.setLockeddate(new Date());
                }
                admin.setLoginfailurecount(loginFailureCount);
                adminService.update(admin);
                throw new IncorrectCredentialsException();
            }
            admin.setLoginip(ip);
            admin.setLogindate(new Date());
            admin.setLoginfailurecount(0);
            adminService.update(admin);
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(new Principal(admin.getId().longValue(), username), password, getName());
            SecurityUtils.getSubject().getSession().setAttribute("id", admin.getId());
//            SecurityUtils.getSubject().getSession().setAttribute("role", admin.getRoles().iterator().next().getId());
//            if(admin.getRoles().iterator().next().getId()==2){
//                Date d = new Date();
//                int hours = d.getHours();
//                if(hours<9||hours>21){
//                    throw new LockedAccountException();
//                }
//            }
            return simpleAuthenticationInfo;
        }
		throw new UnknownAccountException();
	}

	/**
	 * 获取授权信息
	 * 
	 * @param principals
	 *            principals
	 * @return 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		if (principal != null) {
			List<String> authorities = adminService.findAuthorities(principal.getId());
			if (authorities != null) {
				SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
				authorizationInfo.addStringPermissions(authorities);
				return authorizationInfo;
			}
		}
		return null;
	}

}