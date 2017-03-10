class mx.utils.IteratorImpl implements mx.utils.Iterator
{
    function IteratorImpl(coll)
    {
        this._collection = coll;
        this._cursor = 0;
    }
    function hasNext()
    {
        return this._cursor < this._collection.getLength();
    }
    function next()
    {
        return this._collection.getItemAt(this._cursor++);
    }
}
