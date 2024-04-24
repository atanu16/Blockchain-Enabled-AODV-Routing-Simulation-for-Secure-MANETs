classdef Block < handle
    properties
        Index
        Timestamp
        Data
        PreviousHash
        Hash
        Nonce
    end
    methods
        function block = Block(index, timestamp, data, previousHash)
            block.Index = index;
            block.Timestamp = timestamp;
            block.Data = data;
            block.PreviousHash = previousHash;
            block.Hash = '';
            block.Nonce = 0;
        end
    end
end