classdef Series ...
    < rephrase.Terminal ...
    & rephrase.DataMixin ...
    & rephrase.ColorMixin ...
    & rephrase.PlotMixin

    properties % (Constant)
        Type = string(rephrase.Type.SERIES)
    end


    properties (Hidden)
        Settings_Units (1, 1) string = ""
        Settings_Bands = {}
    end


    methods
        function this = Series(title, input, varargin)
            this = this@rephrase.Terminal(title, varargin{:});
            this.Content = input;
        end%


        function this = finalize(this, varargin)
            if ~isempty(this.Settings_Bands) && rephrase.Type.isChart(this.Parent.Type)
                center = this.Content;
                startDate = this.Parent.Settings_StartDate;
                endDate = this.Parent.Settings_EndDate;
                if ~iscell(this.Settings_Bands)
                    this.Settings_Bands = {this.Settings_Bands};
                end
                for i = 1 : numel(this.Settings_Bands)
                    this.Settings_Bands{i} = finalize(this.Settings_Bands{i}, center, startDate, endDate);
                end
            end
            finalize@rephrase.Terminal(this);
            this.Content = finalizeSeriesData(this, this.Content);
        end%
    end


    methods (Static)
        function these = fromMultivariate(titles, inputs, varargin)
            titles = textual.stringify(titles);
            numTitles = numel(titles);
            inputs.Data = inputs.Data(:, :);
            numSeries = size(inputs.Data, 2);
            these = rephrase.Series.empty(1, 0);
            if isempty(titles)
                titles = repmat("", 1, numSeries);
            elseif numTitles==1 && numSeries>1
                titles = repmat(titles, 1, numSeries);
            end
            for i = 1 : numSeries
                these(end+1) = rephrase.Series(titles(i), inputs{:, i}, varargin{:});
            end
        end%
    end
end 

