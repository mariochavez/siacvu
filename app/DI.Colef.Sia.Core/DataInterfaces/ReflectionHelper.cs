using System;
using System.Linq.Expressions;
using System.Reflection;

namespace DecisionesInteligentes.Colef.Sia.Core.DataInterfaces
{
    public static class ReflectionHelper
    {
        public static bool IsMethodExpression<MODEL>(Expression<Func<MODEL, object>> expression)
        {
            return expression.Body is MethodCallExpression;
        }

        public static bool IsPropertyExpression<MODEL>(Expression<Func<MODEL, object>> expression)
        {
            return getMemberExpression(expression, false) != null;
        }

        public static MemberInfo GetMember<MODEL>(Expression<Func<MODEL, object>> expression)
        {
            MemberExpression memberExpression = getMemberExpression(expression);
            return memberExpression.Member;
        }

        public static FieldInfo GetField<MODEL>(Expression<Func<MODEL, object>> expression)
        {
            return (FieldInfo)GetMember(expression);
        }

        public static PropertyInfo GetProperty<MODEL>(Expression<Func<MODEL, object>> expression)
        {
            return (PropertyInfo)GetMember(expression);
        }

        public static PropertyInfo GetProperty<MODEL, T>(Expression<Func<MODEL, T>> expression)
        {
            MemberExpression memberExpression = getMemberExpression(expression);
            return (PropertyInfo)memberExpression.Member;
        }

        private static MemberExpression getMemberExpression<MODEL, T>(Expression<Func<MODEL, T>> expression)
        {
            return getMemberExpression(expression, true);
        }

        private static MemberExpression getMemberExpression<MODEL, T>(Expression<Func<MODEL, T>> expression, bool enforceCheck)
        {
            MemberExpression memberExpression = null;
            if (expression.Body.NodeType == ExpressionType.Convert)
            {
                var body = (UnaryExpression)expression.Body;
                memberExpression = body.Operand as MemberExpression;
            }
            else if (expression.Body.NodeType == ExpressionType.MemberAccess)
            {
                memberExpression = expression.Body as MemberExpression;
            }

            if (enforceCheck && memberExpression == null)
            {
                throw new ArgumentException("Not a member access", "member");
            }
            return memberExpression;
        }

        public static MethodInfo GetMethod<T>(Expression<Func<T, object>> expression)
        {
            MethodCallExpression methodCall = (MethodCallExpression)expression.Body;
            return methodCall.Method;
        }

        public static MethodInfo GetMethod<T, U>(Expression<Func<T, U>> expression)
        {
            MethodCallExpression methodCall = (MethodCallExpression)expression.Body;
            return methodCall.Method;
        }

        public static MethodInfo GetMethod<T, U, V>(Expression<Func<T, U, V>> expression)
        {
            MethodCallExpression methodCall = (MethodCallExpression)expression.Body;
            return methodCall.Method;
        }

        public static MethodInfo GetMethod(Expression<Func<object>> expression)
        {
            MethodCallExpression methodCall = (MethodCallExpression)expression.Body;
            return methodCall.Method;
        }
    }
}
