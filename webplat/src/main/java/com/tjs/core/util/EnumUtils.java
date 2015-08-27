package com.tjs.core.util;

import java.util.Arrays;
import java.util.List;

import com.tjs.admin.utils.StringUtils;

public class EnumUtils {
	
	 private EnumUtils()
	    {
	    }

	    public static List getEnumValues(IEnum ie[])
	    {
	        return Arrays.asList(ie);
	    }

	    public static String getDefaultKey(IEnum ie[])
	    {
	        if(ie == null || ie.length == 0)
	            return "";
	        else
	            return ie[0].getKey();
	    }

	    public static String getValue(IEnum ie[], String key)
	    {
	        if(ie == null || ie.length == 0 || StringUtils.isBlank(key))
	            return "";
	        IEnum aienum[];
	        int j = (aienum = ie).length;
	        for(int i = 0; i < j; i++)
	        {
	            IEnum e = aienum[i];
	            if(key.equals(e.getKey()))
	                return e.getValue();
	        }

	        return "";
	    }

//	    public static String getValue(IIntegerKeyEnum ie[], Integer key)
//	    {
//	        if(ie == null || ie.length == 0 || key == null)
//	            return "";
//	        IIntegerKeyEnum aiintegerkeyenum[];
//	        int j = (aiintegerkeyenum = ie).length;
//	        for(int i = 0; i < j; i++)
//	        {
//	            IIntegerKeyEnum e = aiintegerkeyenum[i];
//	            if(key.equals(e.getIntegerKey()))
//	                return e.getValue();
//	        }
//
//	        return "";
//	    }

	    public static IEnum valueOf(IEnum ie[], String key)
	    {
	        if(ie == null || ie.length == 0 || StringUtils.isBlank(key))
	            return null;
	        IEnum aienum[];
	        int j = (aienum = ie).length;
	        for(int i = 0; i < j; i++)
	        {
	            IEnum e = aienum[i];
	            if(key.equals(e.getKey()))
	                return e;
	        }

	        return null;
	    }

	    public static IEnum valueOfName(IEnum ie[], String name)
	    {
	        if(ie == null || ie.length == 0 || StringUtils.isBlank(name))
	            return null;
	        IEnum aienum[];
	        int j = (aienum = ie).length;
	        for(int i = 0; i < j; i++)
	        {
	            IEnum e = aienum[i];
	            if(name.equals(e.getName()))
	                return e;
	        }

	        return null;
	    }

//	    public static IIntegerKeyEnum valueOf(IIntegerKeyEnum ie[], Integer key)
//	    {
//	        if(ie == null || ie.length == 0 || key == null)
//	            return null;
//	        IIntegerKeyEnum aiintegerkeyenum[];
//	        int j = (aiintegerkeyenum = ie).length;
//	        for(int i = 0; i < j; i++)
//	        {
//	            IIntegerKeyEnum e = aiintegerkeyenum[i];
//	            if(key.equals(e.getIntegerKey()))
//	                return e;
//	        }
//
//	        return null;
//	    }

	    public static String getDefaultValue(IEnum ie[])
	    {
	        return getValue(ie, getDefaultKey(ie));
	    }

	    public static IEnum valueOfLabel(IEnum ie[], String value)
	    {
	        if(ie == null || ie.length == 0 || StringUtils.isBlank(value))
	            return null;
	        IEnum aienum[];
	        int j = (aienum = ie).length;
	        for(int i = 0; i < j; i++)
	        {
	            IEnum e = aienum[i];
	            if(value.equals(e.getValue()))
	                return e;
	        }

	        return null;
	    }

	    public static List getEnumValuesByClassName(String enumClassName)
	    {
	        Class clazz = null;
	        List EnumList = null;
	        try
	        {
	            clazz = Class.forName(enumClassName);
	            IEnum enums[] = (IEnum[])clazz.getEnumConstants();
	            EnumList = getEnumValues(enums);
	        }
	        catch(ClassNotFoundException e)
	        {
	            e.printStackTrace();
	        }
	        return EnumList;
	    }
}
