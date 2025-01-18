public abstract class DocumentValidator {

    protected Boolean isValid(String document) {
        if (document?.length() == 11 || document?.length() == 18) {
            return true;
        }
        return false;
    }

}