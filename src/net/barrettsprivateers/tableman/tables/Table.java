package net.barrettsprivateers.tableman.tables;

import net.barrettsprivateers.tableman.Environment;
import net.barrettsprivateers.tableman.Expression;
import net.barrettsprivateers.tableman.ExpressionResult;

import java.util.*;
import java.io.*;


public interface Table {
    public abstract String getName();

    public abstract String getModuleName();

    public abstract String getFullName();

    public abstract ExpressionResult roll();

    public abstract ExpressionResult roll(Expression expression);

    public abstract ExpressionResult roll(Environment environment);

    public abstract ExpressionResult roll(Expression expression, Environment environment);

    public abstract void reset(Environment environment);
}
